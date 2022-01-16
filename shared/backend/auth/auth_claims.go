package auth

import (
	"errors"
	"time"
)

type Claims struct {
	UserId int
	IssuedAt time.Time
	ExpiryTime time.Time
	AuthLevel Level
}

func NewAuthClaims(userId int, duration time.Duration, level Level) *Claims {
	return &Claims{
		UserId: userId,
		IssuedAt: time.Now(),
		ExpiryTime: time.Now().Add(duration),
		AuthLevel: level,
	}
}

func (c Claims) Valid() error {
	if c.ExpiryTime.Before(time.Now()) {
		return errors.New("expired auth token")
	}

	return nil
}
