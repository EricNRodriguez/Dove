package service

import (
	"crypto/sha1"
	"encoding/base64"
	"github.com/EricNRodriguez/Dove/auth"
	error2 "github.com/EricNRodriguez/Dove/error"
	pb "github.com/EricNRodriguez/Dove/gencode"
	"github.com/EricNRodriguez/Dove/model"
	"log"
)

type AccountService interface {
	Login(loginRequest *pb.LoginRequestData) (loginResponse pb.LoginResponseData, err error)
	Register(registerRequest *pb.RegisterRequestData) (registerResponseData pb.RegisterResponseData, err error)
	UpdateProfileImage(sessionContext *auth.SessionContext, userId int, request *pb.NewProfileImageRequestData) (response pb.NewProfileImageResponseData, err error)
	UpdateProfileData(sessionContext *auth.SessionContext, userId int, request *pb.UpdateUserProfileRequestData) (response pb.UpdateUserProfileResponseData, err error)
}

type blobStore interface {
	GetObject(path string) ([]byte, error)
	PutObject(path string, content []byte) error
}

type accountService struct {
	authService AuthService
	userStore model.UserStore
	imageStore blobStore
}

func NewAccountService(authService AuthService, userStore model.UserStore, imageStore blobStore) AccountService {
	return &accountService{
		authService: authService,
		userStore: userStore,
		imageStore: imageStore,
	}
}

func (s *accountService) Login(loginRequest *pb.LoginRequestData) (loginResponse pb.LoginResponseData, err error) {
	user, err := s.userStore.GetUserByUsername(loginRequest.Username)
	if err = s.authService.VerifyPassword(loginRequest.Password, user.Password); err != nil {
		log.Printf("failed login attempt by user (%s) | %s\n", user.Username, err.Error())
		return
	}

	loginResponse.User = s.userModelToUserData(user)
	loginResponse.AuthToken, err = s.authService.CreateNewSessionToken(user.UserId)

	return
}

func (s *accountService) Register(registerRequest *pb.RegisterRequestData) (registerResponse pb.RegisterResponseData, err error) {

	hashedPassword, err := s.authService.HashPassword(registerRequest.Password)
	if err != nil {
		return
	}

	user, err := s.userStore.CreateNewUser(registerRequest.Username, hashedPassword)
	if err != nil {
		return
	}

	registerResponse.User = s.userModelToUserData(user)
	registerResponse.AuthToken, err = s.authService.CreateNewSessionToken(user.UserId)
	if err != nil {
		return
	}

	return
}

func (s *accountService) userModelToUserData(userModel *model.User) *pb.UserData {
	return &pb.UserData{
		UserId: int64(userModel.UserId),
		Username: userModel.Username,
		ProfileImage: &pb.NetworkImageData{
			LocalPath: userModel.ImagePath,
		},
		CreatedAt: userModel.CreatedAt,
	}
}

func (s *accountService) UpdateProfileImage(sessionContext *auth.SessionContext, userId int, request *pb.NewProfileImageRequestData) (response pb.NewProfileImageResponseData, err error) {
	response = pb.NewProfileImageResponseData{}

	if !s.checkCanEditUserData(sessionContext, userId) {
		err = error2.NewForbiddenError(nil, "insufficient permissions to edit another users data")
		return
	}

	newImagePath := s.generateProfileImageRoute(request.Image.Data)
	if err = s.imageStore.PutObject(newImagePath, request.Image.Data); err != nil {
		return
	}

	user, err := s.getUser(userId)
	if err != nil {
		return
	}

	user.ImagePath = newImagePath
	if err = s.userStore.UpdateUser(user); err != nil {
		return
	}

	response.Image = &pb.NetworkImageData{
		LocalPath: newImagePath,
	}

	return
}

func (s *accountService) generateProfileImageRoute(image []byte) string {
	h := sha1.New()
	h.Write(image)
	return base64.URLEncoding.EncodeToString(h.Sum(nil))
}

func (s *accountService) getUser(userId int) (user *model.User, err error) {
	return s.userStore.GetUserById(userId)
}

func (s *accountService) checkCanEditUserData(sessionContext *auth.SessionContext, userId int) bool {
	return sessionContext.UserId == userId
}

func (s *accountService) UpdateProfileData(sessionContext *auth.SessionContext, userId int, request *pb.UpdateUserProfileRequestData) (response pb.UpdateUserProfileResponseData, err error) {
	if !s.checkCanEditUserData(sessionContext, userId) {
		err = error2.NewForbiddenError(nil, "insufficient permissions to edit another users data")
		return
	}

	user, err := s.getUser(userId)
	if err != nil {
		return
	}

	user.Username = request.Username
	user.About = request.About

	if err =  s.userStore.UpdateUser(user); err != nil {
		return
	}

	return
}

