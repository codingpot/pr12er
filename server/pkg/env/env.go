package env

import (
	"os"
	"strconv"
	"strings"
)

var (
	Version  = "dev" // nolint:revive
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
