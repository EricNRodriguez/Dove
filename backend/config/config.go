package config

type Config struct {
	Server struct {
		Addr string `yaml:"addr"`
		Port int    `yaml:"port"`
	} `yaml:"server"`
	Postgres struct {
		User   string `yaml:"user"`
		DbName string `yaml:"dbname"`
		Host   string `yaml:"host"`
		Port   int    `yaml:"port"`
	} `yaml:"postgres"`
	Auth struct {
		JwtSecret         string `yaml:"jwtSecret"`
		ExpiryTimeMinutes int    `yaml:"expiryTimeMinutes"`
		HashCost          int    `yaml:"hashCost"`
	} `yaml:"auth"`
}