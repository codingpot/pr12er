package env

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

var (
	Version  = "dev"
	Nversion = "pr12er-" + Version
	Debug, _ = strconv.ParseBool(getEnvVar("DEBUG", "false"))

	ServicePort = getEnvVar("PR12ER_GRPC_PORT", "9000")
)

func getEnvVar(key, fallbackValue string) string {
	if val, ok := os.LookupEnv(key); ok {
		if val != "" {
			return strings.TrimSpace(val)
		}
	}
	return fallbackValue
}

func getEnvRequired(key string) string {
	val, ok := os.LookupEnv(key)
	if !ok {
		panic(fmt.Errorf("environment variable(key: \"%s\") is required", key))
	}
	return val
}
