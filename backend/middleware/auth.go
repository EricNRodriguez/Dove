package middleware

import (
	"github.com/EricNRodriguez/Dove/auth"
	"github.com/EricNRodriguez/Dove/model"
	"github.com/EricNRodriguez/Dove/util"
	"github.com/gorilla/mux"
	"net/http"
)

const (
	HeaderAuthorizationField = "Dove-Auth"
	SessionContextKey = "Session-Context"
)

type AuthVerifier interface {
	VerifyApiToken(token string) (claims auth.Claims, err error)
}

func BuildJwtAuthenticationMiddleware(authVerifier AuthVerifier, userStore model.UserStore, ignorePaths ...string) mux.MiddlewareFunc {

	authenticationMiddleware := func(handler http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			var (
				authT = r.Header.Get(HeaderAuthorizationField)
				claims auth.Claims
				err   error
			)

			claims, err = authVerifier.VerifyApiToken(authT)
			if err != nil {
				util.SendJSON(nil, err, w)
				return
			}

			user, err := userStore.GetUserById(claims.UserId)
			if err != nil {
				util.SendJSON(nil, err, w)
				return
			}

			sessionContext := auth.NewSessionContext(user.Username, user.UserId, claims.AuthLevel)
			r.Header.Set(SessionContextKey, util.Serialize(sessionContext))

			handler.ServeHTTP(w, r)
		})
	}

	return func(handler http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			if !util.StrArrContains(ignorePaths, r.URL.Path) {
				authenticationMiddleware(handler).ServeHTTP(w, r)
			} else {
				handler.ServeHTTP(w, r)
			}
			return
		})
	}



}

