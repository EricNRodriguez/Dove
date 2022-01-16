package model

import (
	error2 "github.com/EricNRodriguez/Dove/error"
	"github.com/EricNRodriguez/Dove/postgres"
	"github.com/jackc/pgconn"
	"gorm.io/gorm"
	"log"
	"time"
)

type FeaturePoint struct {
	FeaturePointId int `gorm:"primary_key;type:sequence"`
	Title string
	Description string
	Location *Point
	OwnerId int
	CreatedAt int64
}

func (FeaturePoint) TableName() string {
	return "feature_point"
}

type FeaturePointStore interface {
	Transaction(func(FeaturePointStore) error) error
	InsertNewFeaturePoint(point *FeaturePoint) (featurePointId int, err error)
	GetAllFeaturePointsWithinBounds(*CircleBounds) ([]FeaturePoint, error)
	GetFeaturePointById(featurePointId int) (featurePoint *FeaturePoint, err error)
	UpdateFeaturePoint(featurePoint *FeaturePoint) error
	DeleteFeaturePoint(featurePointId int) (err error)
}

type featurePointStore struct {
	DB *gorm.DB
}

func NewFeaturePointStore(DB *gorm.DB) *featurePointStore {
	return &featurePointStore{
		DB: DB,
	}
}


func (f *featurePointStore) Transaction(transaction func(FeaturePointStore) error) error {
	return f.DB.Transaction(func(tx *gorm.DB) error {
		return transaction(NewFeaturePointStore(tx))
	})
}

func (f *featurePointStore) InsertNewFeaturePoint(point *FeaturePoint) (id int, err error) {
	point.CreatedAt = time.Now().Unix()

	f.DB.Transaction(func(tx *gorm.DB) error {
		if err = f.DB.Select("title", "description", "location", "owner_id", "created_at").Create(point).Error; err != nil {
			return err
		}

		if err = f.DB.Raw("SELECT last_value FROM feature_point_feature_point_id_seq").Scan(&id).Error; err != nil {
			return err
		}

		return nil
	})

	if err != nil {
		if driverError, ok := err.(*pgconn.PgError); ok {
			if driverError.Code == postgres.UniqueViolationErr {
				err = error2.NewResourceAlreadyExistsError(err, "Title must be unique")
			}
		}
	}

	return
}

func (f *featurePointStore) GetAllFeaturePointsWithinBounds(bounds *CircleBounds) (points []FeaturePoint, err error) {
	err = f.DB.Where("ST_DistanceSphere(location, ?) <= ?", bounds.GetPoint(), bounds.GetRadiusMeters()).Find(&points).Error

	log.Printf("found %d feature points within %fm of (%f, %f)\n", len(points), bounds.GetRadiusMeters(), bounds.GetPoint().Lng, bounds.GetPoint().Lat)
	return
}

func (f *featurePointStore) UpdateFeaturePoint(featurePoint *FeaturePoint) error {
	return f.DB.Save(featurePoint).Error
}

func (f *featurePointStore) GetFeaturePointById(featurePointId int) (featurePoint *FeaturePoint, err error) {
	featurePoint = &FeaturePoint{}
	err = f.DB.Where("feature_point_id = ?", featurePointId).First(featurePoint).Error
	return
}

func (f *featurePointStore) DeleteFeaturePoint(featurePointId int) error {
	return f.DB.Where("feature_point_id = ?", featurePointId).Delete(&FeaturePoint{}).Error
}