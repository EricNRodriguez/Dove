package service

import (
	"crypto/sha1"
	"encoding/base64"
	"github.com/EricNRodriguez/Dove/auth"
	messageschema "github.com/EricNRodriguez/Dove/gencode"
	"github.com/EricNRodriguez/Dove/model"
	_ "github.com/beyondstorage/go-service-fs/v3"
	"time"
)

type FeaturePointService interface {
	InsertNewFeaturePoint(sessionContext *auth.SessionContext, featurePoint *messageschema.NewFeaturePointRequestData) (featurePointData *messageschema.FeaturePointData, err error)
	GetAllFeaturePointsWithinQueryCircle(sessionContext *auth.SessionContext, bounds *model.CircleBounds) (featurePoint *messageschema.GetAllFeaturePointsWithinBoundsResponseData, err error)
	UpdateFeaturePoint(sessionContext *auth.SessionContext, updateRequest *messageschema.UpdateFeaturePointRequestData) error
}

type BlobStore interface {
	GetObject(path string) ([]byte, error)
	PutObject(path string, content []byte) error
}

type featurePointService struct {
	featurePointStore model.FeaturePointStore
	imageMetadataStore model.FeaturePointImageMetadataStore
	imageStore BlobStore
}

func NewFeaturePointService(featurePointStore model.FeaturePointStore, imageMetadataStore model.FeaturePointImageMetadataStore, imageStore BlobStore) FeaturePointService {
	return &featurePointService{
		featurePointStore: featurePointStore,
		imageMetadataStore: imageMetadataStore,
		imageStore: imageStore,
	}
}

func (s *featurePointService) InsertNewFeaturePoint(sessionContext *auth.SessionContext, featurePoint *messageschema.NewFeaturePointRequestData) (featurePointData *messageschema.FeaturePointData, err error) {
	featurePointData = &messageschema.FeaturePointData{
		OwnerId: int64(sessionContext.UserId),
		CreatedAt: time.Now().Unix(),
	}

	err = s.featurePointStore.Transaction(func(featurePointStore model.FeaturePointStore) error {
		featurePointId, err := featurePointStore.InsertNewFeaturePoint(&model.FeaturePoint{
			Title: "",
			Description: "",
			Location: &model.Point{
				Lat: featurePoint.Location.Latitude,
				Lng: featurePoint.Location.Longitude,
			},
			OwnerId: sessionContext.UserId,
			CreatedAt: time.Now().Unix(),
		})
		if err != nil {
			return err
		}

		featurePointData.FeaturePointId = int64(featurePointId)

		return nil
	})

	return
}

// Eventual consistency is taken with deleted images. Blobs remain until a daemon worker cleans unused images.
func (s *featurePointService) UpdateFeaturePoint(sessionContext *auth.SessionContext, updateRequest *messageschema.UpdateFeaturePointRequestData) (err error) {

	err = s.featurePointStore.Transaction(func(featurePointStore model.FeaturePointStore) error {
		if err = s.imageMetadataStore.Transaction(func(imageMetadataStore model.FeaturePointImageMetadataStore) error {

			for _, img := range updateRequest.Deleted {
				if err = imageMetadataStore.Delete(int(img.Id)); err != nil {
					return err
				}
			}

			for _, img := range updateRequest.Uploaded {
				blobHash := s.generateImageHash(img.Data)

				if _, err = imageMetadataStore.InsertNewImageRecord(&model.FeaturePointImageMetadata{
					FeaturePointId: int(updateRequest.Id),
					CreatedAt: time.Now().Unix(),
					Path: blobHash,
				}); err != nil {
					return err
				}

				if err = s.imageStore.PutObject(blobHash, img.Data); err != nil {
					return err
				}
			}

			return nil
		}); err != nil {
			return err
		}

		featurePoint, err := featurePointStore.GetFeaturePointById(int(updateRequest.Id))
		if err != nil {
			return err
		}

		featurePoint.Title = updateRequest.Title
		featurePoint.Description = updateRequest.Description

		return featurePointStore.UpdateFeaturePoint(featurePoint)
	})

	return
}

func (s *featurePointService) GetAllFeaturePointsWithinQueryCircle(sessionContext *auth.SessionContext, bounds *model.CircleBounds) (featurePoint *messageschema.GetAllFeaturePointsWithinBoundsResponseData, err error) {
	resp := &messageschema.GetAllFeaturePointsWithinBoundsResponseData{}

	points, err := s.featurePointStore.GetAllFeaturePointsWithinBounds(bounds)
	if err != nil {
		return nil, err
	}

	for _, featurePoint := range points {
		imageMetadata, err := s.imageMetadataStore.GetAllImageMetadata(featurePoint.FeaturePointId)
		if err != nil {
			return nil, err
		}

		featurePointData := &messageschema.FeaturePointData{
			FeaturePointId: int64(featurePoint.FeaturePointId),
			OwnerId: int64(featurePoint.OwnerId),
			Title: featurePoint.Title,
			Description: featurePoint.Description,
			Location: &messageschema.LocationData{
				Latitude: featurePoint.Location.Lat,
				Longitude: featurePoint.Location.Lng,
			},
			CreatedAt: featurePoint.CreatedAt,
		}

		for _, img := range imageMetadata {
			featurePointData.Images = append(featurePointData.Images, &messageschema.FeaturePointImageData{
				Id: int32(img.ImageId),
				Image: &messageschema.NetworkImageData{
					LocalPath: img.Path,
				},
			})
		}

		resp.FeaturePoints = append(resp.FeaturePoints, featurePointData)
	}

	return resp, nil
}

func (s *featurePointService) generateImageHash(image []byte) string {
	h := sha1.New()
	h.Write(image)
	return base64.URLEncoding.EncodeToString(h.Sum(nil))
}