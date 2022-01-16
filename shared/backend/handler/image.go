package handler

import (
	"github.com/EricNRodriguez/Dove/auth"
	error2 "github.com/EricNRodriguez/Dove/error"
	"github.com/EricNRodriguez/Dove/server"
	"github.com/EricNRodriguez/Dove/util"
	"github.com/gorilla/mux"
	"net/http"
)

type blobStore interface {
	GetObject(path string) ([]byte, error)
}

func BuildGetImageByBlobHashHandler(imageStore blobStore) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		vars := mux.Vars(r)
		hash, ok := vars["hash"]
		if !ok {
			err := error2.NewInvalidRequestDataError(nil, "Invalid query parameters")
			util.SendJSON(nil, err, w)
			return
		}

		image, err := imageStore.GetObject(hash)
		if err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		w.WriteHeader(http.StatusOK)
		w.Write(image)
	}
}

