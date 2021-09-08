package metrics

import (
	"fmt"
	"net/http"

	"github.com/codingpot/pr12er/server/pkg/env"
	grpc_prometheus "github.com/grpc-ecosystem/go-grpc-prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	log "github.com/sirupsen/logrus"
	"google.golang.org/grpc"
)

type PromServer struct {
	Mux    *http.ServeMux
	config *env.Config
}

// Start starts the server listening at PrometheusPort.
func (s *PromServer) Start() {
	log.WithFields(log.Fields{
		"port": s.config.PrometheusPort,
	}).Info("Running Prometheus server")
	if err := http.ListenAndServe(fmt.Sprintf(":%s", s.config.PrometheusPort), s.Mux); err != nil {
		log.Panic("Unable to start a prometheus server.")
	}
}

// ProvidePrometheusServer returns http server /metrics endpoint where metrics are served.
func ProvidePrometheusServer(grpcServer *grpc.Server, config *env.Config) *PromServer {
	mux := http.NewServeMux()
	grpc_prometheus.EnableHandlingTimeHistogram()
	grpc_prometheus.Register(grpcServer)
	// Register Prometheus metrics handler.
	mux.Handle("/metrics", promhttp.Handler())

	return &PromServer{
		Mux:    mux,
		config: config,
	}
}
