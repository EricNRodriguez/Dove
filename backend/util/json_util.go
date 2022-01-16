package util

import (
	"encoding/json"
	"fmt"
	error2 "github.com/EricNRodriguez/Dove/error"
	"io"
	"log"
	"net/http"
	"reflect"
)

type JSONRequestResponse struct {
	Data  interface{} `json:"data"`
	Error string      `json:"error"`
}

func SendJSON(data interface{}, err error, w http.ResponseWriter) {
	r := &JSONRequestResponse{
		Data: data,
	}
	if err != nil {
		r.Error = getHttpErrorMessage(err)
		w.WriteHeader(getHttpErrorStatus(err))
	} else {
		w.WriteHeader(http.StatusOK)
	}

	rJSON, err := json.Marshal(r)
	if err != nil {
		panic(err)
	}

	w.Header().Set("Content-Type", "application/json")

	w.Write(rJSON)
	return
}

func Serialize(obj interface{}) string {
	data, err := json.Marshal(obj)
	if err != nil {
		log.Panicf("failed to serialize object of type %s | %s\n", reflect.TypeOf(obj).String(), err.Error())
	}

	return string(data)
}

func StrictDeserialize(data string, obj interface{}) {
	if err := json.Unmarshal([]byte(data), obj); err != nil {
		log.Panicf("failed to deserialize object of type %s | %s\n", reflect.TypeOf(obj).String(), err.Error())
	}
	return
}

func SoftDeserialize(data io.Reader, obj interface{}) (err error) {
	if err = json.NewDecoder(data).Decode(obj); err != nil {
		err = fmt.Errorf("%s | %w", fmt.Sprintf("failed to deserialize object of type %s\n", reflect.TypeOf(obj).String()), err)
		log.Println(err)
		err = error2.NewInvalidRequestDataError(err, "The provided data differs from the expected form")
	}
	return
}

func getHttpErrorStatus(err error) int {
	switch err.(type) {
	case error2.ResourceNotFoundError:
		return http.StatusNotFound
	case error2.NotAuthorizedError:
		return http.StatusUnauthorized
	case error2.ResourceAlreadyExistsError:
		return http.StatusBadRequest
	case error2.ForbiddenError:
		return http.StatusForbidden
	case error2.InvalidRequestDataError:
		return http.StatusBadRequest
	default:
		return http.StatusInternalServerError
	}
}

func getHttpErrorMessage(err error) string {
	switch err.(type) {
	case error2.Err:
		return (err.(error2.Err)).ExternalError()
	default:
		return ""
	}
}
