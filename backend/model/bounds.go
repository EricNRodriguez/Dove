package model

type CircleBounds struct {
	center   *Point
	radiusMeters float64
}

func NewCircleBounds(lat float64, lng float64, radiusMeters float64) *CircleBounds {
	return &CircleBounds{
		center: &Point{
			Lat: lat,
			Lng: lng,
		},
		radiusMeters: radiusMeters,
	}
}

func (b *CircleBounds) GetPoint() *Point {
	return b.center
}

func (b *CircleBounds) GetRadiusMeters() float64 {
	return b.radiusMeters
}