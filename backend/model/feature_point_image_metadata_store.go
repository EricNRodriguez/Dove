package model

import (
	"gorm.io/gorm"
)

type FeaturePointImageMetadata struct {
	ImageId int `gorm:"primary_key;type:sequence"`
	FeaturePointId int
	Path string
	CreatedAt int64
}


func (FeaturePointImageMetadata) TableName() string {
	return "feature_point_image_metadata"
}

type FeaturePointImageMetadataStore interface {
	Transaction(transaction func(FeaturePointImageMetadataStore) error) error
	InsertNewImageRecord(record *FeaturePointImageMetadata) (insertedRecord *FeaturePointImageMetadata, err error)
	GetAllImageMetadata(featurePointId int) (records []FeaturePointImageMetadata, err error)
	Delete(imageID int) error
}

type featurePointImageMetadataStore struct {
	DB *gorm.DB
}

func NewFeaturePointImageMetadataStore(DB *gorm.DB) *featurePointImageMetadataStore {
	return &featurePointImageMetadataStore{
		DB: DB,
	}
}

func (f *featurePointImageMetadataStore) Transaction(transaction func(FeaturePointImageMetadataStore) error) error {
	return f.DB.Transaction(func(tx *gorm.DB) error {
			return transaction(NewFeaturePointImageMetadataStore(tx))
		})
}

func (f *featurePointImageMetadataStore) InsertNewImageRecord(record *FeaturePointImageMetadata) (insertedRecord *FeaturePointImageMetadata, err error){
	err = f.DB.Select("feature_point_id", "path", "created_at").Create(record).Error
	return
}

func (f *featurePointImageMetadataStore) GetAllImageMetadata(featurePointId int) (records []FeaturePointImageMetadata, err error) {
	err = f.DB.Where("feature_point_id = ?", featurePointId).Find(&records).Error
	return
}

func (f *featurePointImageMetadataStore) Delete(imageId int) error {
	return f.DB.Where("image_id = ?", imageId).Delete(&FeaturePointImageMetadata{}).Error
}



