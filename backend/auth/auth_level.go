package auth

type Level int

const (
	Guest Level = iota
	User
	Admin
)


