package handler

import (
	"github.com/EricNRodriguez/Dove/auth"
	pb "github.com/EricNRodriguez/Dove/gencode"
	"github.com/EricNRodriguez/Dove/server"
	"github.com/EricNRodriguez/Dove/service"
	"github.com/EricNRodriguez/Dove/util"
	"net/http"
)

func BuildLoginHandler(accountService service.AccountService) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			loginRequest = &pb.LoginRequestData{}
			err error
		)

		if err = util.SoftDeserialize(r.Body, loginRequest); err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		loginResponse, err := accountService.Login(loginRequest)
		if err != nil {
			util.SendJSON(nil, err, w)
			return
		} else {
			util.SendJSON(loginResponse, nil, w)
			return
		}
	}
}

func BuildRegisterHandler(accountService service.AccountService) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			registerForm = &pb.RegisterRequestData{}
			err error
		)

		if err = util.SoftDeserialize(r.Body, registerForm); err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		registerResp, err := accountService.Register(registerForm)

		if err != nil {
			util.SendJSON(nil, err, w)
			return
		} else {
			util.SendJSON(registerResp, err, w)
			return
		}
	}
}


