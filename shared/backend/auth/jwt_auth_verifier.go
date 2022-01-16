package auth

import (
	"errors"
	error2 "github.com/EricNRodriguez/Dove/error"
	"github.com/dgrijalva/jwt-go"
	"log"
)

type JwtAuthVerifier struct {
	apiSecret string
}

func NewJwtAuthVerifier(apiSecret string) *JwtAuthVerifier {
	return &JwtAuthVerifier{
		apiSecret: apiSecret,
	}
}

func (s *JwtAuthVerifier) CreateApiToken(claims Claims) (signedSessionToken string, err error) {
	sessionToken := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	if signedSessionToken, err = sessionToken.SignedString([]byte(s.apiSecret)); err != nil {
		log.Printf("error creating jwt api token | %s\n", err.Error())
		err = errors.New("unable to create api token")
	}

	return
}

func (s *JwtAuthVerifier) VerifyApiToken(token string) (claims Claims, err error) {
	keyFunc := func(token *jwt.Token) (interface{}, error) {
		_, ok := token.Method.(*jwt.SigningMethodHMAC)
		if !ok {
			return nil, error2.NewNotAuthorizedError(err, "Invalid authentication token")
		}

		return []byte(s.apiSecret), nil
	}

	if _, err2:= jwt.ParseWithClaims(token, &claims, keyFunc); err2 != nil {
		log.Printf("invalid api token for user (%s) | %s\n", claims.UserId, err2.Error())
		err = error2.NewNotAuthorizedError(err2, "The provided authorization token is invalid")
	}

	return
}
