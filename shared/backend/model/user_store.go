package model

import (
	error2 "github.com/EricNRodriguez/Dove/error"
	"gorm.io/gorm"
	"time"
)

type User struct {
	UserId    int `gorm:"primary_key;type:sequence"`
	Username  string
	Password  string
	About string
	ImagePath string
	CreatedAt int64
}

func (User) TableName() string {
	return "user"
}

type UserStore interface {
	GetUserHashedPassword(username string) (string, error)
	CreateNewUser(username string, hashedPassword string) (*User, error)
	GetUserByUsername(username string) (*User, error)
	GetUserById(userId int) (user *User, err error)
	UpdateUser(user *User) error
}

type userStore struct {
	DB *gorm.DB
}

func NewUserStore(DB *gorm.DB) UserStore {
	return &userStore{
		DB: DB,
	}
}

func (s *userStore) GetUserHashedPassword(username string) (password string, err error) {
	user := &User{}
	if err = s.DB.Where("username = ?", username).First(user).Error; err != nil {
		return
	}

	password = user.Password

	return
}

func (s *userStore) CreateNewUser(username string, hashedPassword string) (user *User, err error) {
	user = &User{
		Username: username,
		Password: hashedPassword,
		CreatedAt: time.Now().Unix(),
	}
	err = s.DB.Create(user).Error
	return
}

func (s *userStore) GetUserByUsername(username string) (user *User, err error) {
	user = &User{}
	if err = s.DB.Where("username = ?", username).First(user).Error; err != nil {
		return
	}
	return
}

func (s *userStore) GetUserById(userId int) (user *User, err error) {
	user = &User{}

	if err = s.DB.Where("user_id = ?", userId).First(user).Error; err != nil {
		// TODO(ericr): sanitize the error for specific postgres errors
		err = error2.NewResourceNotFoundError(err, "Unable to locate user")
	}
	return
}

func (s *userStore) UpdateUser(user *User) error {
	return s.DB.Where("user_id = ?", user.UserId).Save(user).Error
}

