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

func BuildNewFeaturePointHandler(featurePointService service.FeaturePointService) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			requestBody = &pb.NewFeaturePointRequestData{}
			responseBody = &pb.NewFeaturePointResponseData{}
			err error
		)

		if err = util.SoftDeserialize(r.Body, requestBody); err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		responseBody.FeaturePoint, err = featurePointService.InsertNewFeaturePoint(context, requestBody)

		if err != nil {
			util.SendJSON(nil, err, w)
			return
		} else {
			util.SendJSON(responseBody, nil, w)
			return
		}
	}
}

func BuildUpdateExistingFeaturePointHandler(featurePointService service.FeaturePointService) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			requestBody = &pb.UpdateFeaturePointRequestData{}
			responseBody = &pb.UpdateFeaturePointResponseData{}
			err error
		)

		if err = util.SoftDeserialize(r.Body, requestBody); err != nil {
			util.SendJSON(nil, err, w)
			return
		}

		if err = featurePointService.UpdateFeaturePoint(context, requestBody); err != nil {
			util.SendJSON(nil, err, w)
			return
		} else {
			util.SendJSON(responseBody, nil, w)
			return
		}
	}
}

func BuildGetAllFeaturePointsWithinBoundsHandler(featurePointService service.FeaturePointService) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		var (
			err error
		)

		lat, errLat := strconv.ParseFloat(r.URL.Query().Get("lat"), 64)
		lng, errLng := strconv.ParseFloat(r.URL.Query().Get("lng"), 64)
		radiusMeters, errRadiusMeters := strconv.ParseFloat(r.URL.Query().Get("radius_meters"), 64)

		if errLat != nil || errLng != nil || errRadiusMeters != nil {
			err = error2.NewInvalidRequestDataError(nil, "Invalid query parameters")
			util.SendJSON(nil, err, w)
			return
		}

		featurePoints, err := featurePointService.GetAllFeaturePointsWithinQueryCircle(context, model.NewCircleBounds(lat, lng, radiusMeters))

		if err != nil {
			util.SendJSON(nil, err, w)
			return
		} else {
			util.SendJSON(*featurePoints, nil, w)
			return
		}
	}
}

func BuildDeleteFeaturePointHandler(featurePointStore model.FeaturePointStore) server.HandlerFunc {
	return func(context *auth.SessionContext, w http.ResponseWriter, r *http.Request) {
		vars := mux.Vars(r)
		idStr, ok := vars["id"]
		idInt, err := strconv.Atoi(idStr)
		if !ok || err != nil {
			err = error2.NewInvalidRequestDataError(nil, "Invalid query parameters")
			util.SendJSON(nil, err, w)
			return
		}

		err = featurePointStore.DeleteFeaturePoint(idInt)

		if err != nil {
			util.SendJSON(nil, err, w)
			return
		} else {
			util.SendJSON(pb.DeleteFeaturePointResponseData{}, nil, w)
			return
		}
	}
}