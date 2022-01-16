package handler

import (
	"github.com/EricNRodriguez/Dove/auth"
	error2 "github.com/EricNRodriguez/Dove/error"
	pb "github.com/EricNRodriguez/Dove/gencode"
	"github.com/EricNRodriguez/Dove/model"
	"github.com/EricNRodriguez/Dove/server"
	"github.com/EricNRodriguez/Dove/service"
	"github.com/EricNRodriguez/Dove/util"
	"github.com/gorilla/mux"
	"net/http"
	"strconv"
)

func BuildGetUserByIdHandler(userStore model.UserStore) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			response = &pb.GetUserByIdResponseData{}
			err error
		)

		vars := mux.Vars(r)
		userIdRaw, ok := vars["id"]
		userIdInt, err := strconv.Atoi(userIdRaw)
		if !ok || err != nil {
			err = error2.NewInvalidRequestDataError(nil, "Invalid id query parameter")
			util.SendJSON(nil, err, w)
			return
		}

		user, err := userStore.GetUserById(userIdInt)
		if err != nil {
			util.SendJSON(nil, err, w)
		} else {
			response.User = &pb.UserData{
				UserId: int64(userIdInt),
				Username: user.Username,
				ProfileImage: &pb.NetworkImageData{
					LocalPath: user.ImagePath,
				},
				CreatedAt: user.CreatedAt,
			}
		}

		util.SendJSON(response, nil, w)
	}
}

func BuildPutProfileImageHandler(accountService service.AccountService) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			request = &pb.NewProfileImageRequestData{}
			err error
		)

		vars := mux.Vars(r)
		userIdRaw, ok := vars["id"]
		userIdInt, err := strconv.Atoi(userIdRaw)
		if !ok || err != nil {
			err = error2.NewInvalidRequestDataError(nil, "Invalid id query parameter")
			util.SendJSON(nil, err, w)
			return
		}

		if err = util.SoftDeserialize(r.Body, request); err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		response, err := accountService.UpdateProfileImage(context, userIdInt, request)
		if err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		util.SendJSON(response, nil, w)
	}
}


func BuildPutProfileDataHandler(accountService service.AccountService) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			request = &pb.UpdateUserProfileRequestData{}
			err error
		)

		vars := mux.Vars(r)
		userIdRaw, ok := vars["id"]
		userIdInt, err := strconv.Atoi(userIdRaw)
		if !ok || err != nil {
			err = error2.NewInvalidRequestDataError(nil, "Invalid id query parameter")
			util.SendJSON(nil, err, w)
			return
		}

		if err = util.SoftDeserialize(r.Body, request); err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		response, err := accountService.UpdateProfileData(context, userIdInt, request)
		if err != nil {
			util.SendJSON(nil, err, w)
			return
		} else {
			util.SendJSON(response, nil, w)
			return
		}

	}
}


