package env

import (
	"os"
	"strings"
)

var (
	// ServicePort is the main port.
	ServicePort = getEnvVar("PR12ER_GRPC_PORT", "9000")
	// PrometheusPort is the port for Prometheus metrics (/metrics).
	PrometheusPort = getEnvVar("PR12ER_PROMETHEUS_PORT", "9092")
	GoogleSearchApiKey = getEnvVar("GOOGLE_SEARCH_API_KEY", "NONE")
)

func getEnvVar(key, fallbackValue string) string {
	val := strings.TrimSpace(os.Getenv(key))
	if val == "" {
		return fallbackValue
	}
	return val
}
