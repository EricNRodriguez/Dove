package auth

type SessionContext struct {
	AuthLevel Level `json:"auth_level"`
	Username string `json:"username"`
	UserId int `json:"user_id"`
}

func NewSessionContext(username string, userId int, authLevel Level) *SessionContext {
	return &SessionContext{
		Username: username,
		UserId: userId,
		AuthLevel: authLevel,
	}
}

func NewMinimalSessionContext() *SessionContext {
	return &SessionContext{
		Username: "",
		UserId: -1,
		AuthLevel: Guest,
	}
}