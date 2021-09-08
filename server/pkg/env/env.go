package env

import (
	"os"
	"strings"
)

var (
	// ServicePort is the main port.
	servicePort = getEnvVar("PR12ER_GRPC_PORT", "9000")
	// PrometheusPort is the port for Prometheus metrics (/metrics).
	prometheusPort = getEnvVar("PR12ER_PROMETHEUS_PORT", "9092")
	// GitHubAPIKey is the GitHub API Key used to create an issue.
	gitHubAPIKey = getEnvVar("GITHUB_API_KEY", "")
)

func getEnvVar(key, fallbackValue string) string {
	val := strings.TrimSpace(os.Getenv(key))
	if val == "" {
		return fallbackValue
	}
	return val
}

// Config is a wrapper around environment variables.
type Config struct {
	ServicePort    string
	PrometheusPort string
	GitHubAPIKey   string
}

// ProvideEnvConfig returns an environment Config.
func ProvideEnvConfig() *Config {
	return &Config{
		ServicePort:    servicePort,
		PrometheusPort: prometheusPort,
		GitHubAPIKey:   gitHubAPIKey,
	}
}
