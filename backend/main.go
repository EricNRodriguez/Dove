package main

import (
	"fmt"
	"github.com/EricNRodriguez/Dove/auth"
	"github.com/EricNRodriguez/Dove/config"
	"github.com/EricNRodriguez/Dove/handler"
	"github.com/EricNRodriguez/Dove/middleware"
	"github.com/EricNRodriguez/Dove/model"
	"github.com/EricNRodriguez/Dove/server"
	"github.com/EricNRodriguez/Dove/service"
	_ "github.com/lib/pq"
	"gopkg.in/yaml.v3"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"time"
)

const (
	LoginRoute = "/login"
	RegisterRoute = "/register"
	FeaturePoint = "/feature-point"
	SpecificFeaturePoint = "/feature-point/{id}"
	UserRoute = "/user/{id}"
	UserProfileImageRoute = "/user/{id}/profile-image"
	UserProfileDataRoute = "/user/{id}/data"
	ImageRoute = "/image/{hash}"
)

func main() {
	args := os.Args[1:]
	cfgFilePath := args[0]
	cfgFile, err := ioutil.ReadFile(cfgFilePath)
	if err != nil {
		log.Fatal(err)
	}

	cfg := &config.Config{}
	if err = yaml.Unmarshal(cfgFile, &cfg); err != nil {
		log.Fatal(err)
	}

	s, err := server.New(cfg.Server.Addr, cfg.Server.Port)
	if err != nil {
		log.Fatal(err)
	}

	dbDataSourceName := fmt.Sprintf("user=%s dbname=%s host=%s port=%d", cfg.Postgres.User, cfg.Postgres.DbName, cfg.Postgres.Host, cfg.Postgres.Port)

	db, err := gorm.Open(postgres.Open(dbDataSourceName), &gorm.Config{})
	if err != nil {
		log.Fatal(err.Error())
	}
	log.Printf("connected to postgres database | %s\n", dbDataSourceName)

	authVerifier := auth.NewJwtAuthVerifier(cfg.Auth.JwtSecret)

	userStore := model.NewUserStore(db)
	featurePointStore := model.NewFeaturePointStore(db)
	featurePointMetadataStore := model.NewFeaturePointImageMetadataStore(db)
	imageBlobStore := model.NewLocalFileStore("./.blob_store_root")

	authService := service.NewAuthService(userStore, authVerifier, time.Duration(cfg.Auth.ExpiryTimeMinutes) * time.Minute)
	accountService := service.NewAccountService(authService, userStore, imageBlobStore)
	featurePointService := service.NewFeaturePointService(featurePointStore, featurePointMetadataStore, imageBlobStore)

	s.InjectHandler(LoginRoute, handler.BuildLoginHandler(accountService), http.MethodPost)
	s.InjectHandler(RegisterRoute, handler.BuildRegisterHandler(accountService), http.MethodPost)
	s.InjectHandler(UserProfileImageRoute, handler.BuildPutProfileImageHandler(accountService), http.MethodPut)
	s.InjectHandler(UserProfileDataRoute, handler.BuildPutProfileDataHandler(accountService), http.MethodPut)
	s.InjectHandler(UserRoute, handler.BuildGetUserByIdHandler(userStore), http.MethodGet)

	s.InjectHandler(FeaturePoint, handler.BuildNewFeaturePointHandler(featurePointService), http.MethodPost)
	s.InjectHandler(FeaturePoint, handler.BuildUpdateExistingFeaturePointHandler(featurePointService), http.MethodPut)
	s.InjectHandler(FeaturePoint, handler.BuildGetAllFeaturePointsWithinBoundsHandler(featurePointService), http.MethodGet)
	s.InjectHandler(SpecificFeaturePoint, handler.BuildDeleteFeaturePointHandler(featurePointStore), http.MethodDelete)

	s.InjectHandler(ImageRoute, handler.BuildGetImageByBlobHashHandler(imageBlobStore), http.MethodGet)

	s.InjectMiddleware(middleware.BuildJwtAuthenticationMiddleware(authVerifier, userStore, LoginRoute, RegisterRoute))

	if err := s.Run(); err != nil {
		log.Fatal(fmt.Sprintf("unable to run server | %s\n", err.Error()))
	}
}
