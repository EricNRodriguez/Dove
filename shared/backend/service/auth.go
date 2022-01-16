package service

import (
	"github.com/EricNRodriguez/Dove/auth"
	error2 "github.com/EricNRodriguez/Dove/error"
	"github.com/EricNRodriguez/Dove/model"
	"golang.org/x/crypto/bcrypt"
	"log"
	"time"
)

type AuthVerifier interface {
	CreateApiToken(claims auth.Claims) (signedSessionToken string, err error)
	VerifyApiToken(token string) (claims auth.Claims, err error)
}

type AuthService interface {
	CreateNewSessionToken(userId int) (sessionToken string, err error)
	VerifyPassword(password string, hashedPassword string) (err error)
	HashPassword(password string) (string, error)
}

type authService struct {
	store model.UserStore
	authVerifier AuthVerifier
	tokenExpiryTimeMinutes time.Duration
}

func NewAuthService(store model.UserStore, authVerifier AuthVerifier, tokenExpiryTimeMinutes time.Duration) AuthService {
	return &authService{
		store: store,
		authVerifier: authVerifier,
		tokenExpiryTimeMinutes: tokenExpiryTimeMinutes,
	}
}

func (s *authService) CreateNewSessionToken(userId int) (sessionToken string, err error) {
	claims := auth.NewAuthClaims(userId, s.tokenExpiryTimeMinutes , auth.User)
	sessionToken, err = s.authVerifier.CreateApiToken(*claims)

	return
}

func (s *authService) VerifyPassword(password string, hashedPassword string) (err error) {

	if err2 := bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(password)); err2 != nil {
		err = error2.NewNotAuthorizedError(err2, "Invalid password")
		return
	}

	return
}

func (s *authService) HashPassword(password string) (string, error) {
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(password), 14)
	if err != nil {
		log.Printf("error hashing password | %s\n", err.Error())
	}

	return string(hashedPassword), err
}
