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
	Mux *http.ServeMux
}

// Start starts the server listening at PrometheusPort.
func (s *PromServer) Start() {
	log.WithFields(log.Fields{
		"port": env.PrometheusPort,
	}).Info("Running Prometheus server")
	if err := http.ListenAndServe(fmt.Sprintf(":%s", env.PrometheusPort), s.Mux); err != nil {
		log.Panic("Unable to start a prometheus server.")
	}
}

// NewPrometheusServer returns http server /metrics endpoint where metrics are served.
func NewPrometheusServer(grpcServer *grpc.Server) *PromServer {
	mux := http.NewServeMux()
	grpc_prometheus.EnableHandlingTimeHistogram()
	grpc_prometheus.Register(grpcServer)
	// Register Prometheus metrics handler.
	mux.Handle("/metrics", promhttp.Handler())

	return &PromServer{mux}
}
