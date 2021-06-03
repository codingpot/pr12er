package metrics

import (
	"fmt"
	"net/http"

	"github.com/codingpot/pr12er/server/pkg/env"
	grpc_prometheus "github.com/grpc-ecosystem/go-grpc-prometheus"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	log "github.com/sirupsen/logrus"
	"google.golang.org/grpc"
)

type PromServer struct {
	*http.Server
}

// Start starts the server listening at PrometheusPort.
func (s *PromServer) Start() {
	log.WithFields(log.Fields{
		"port": env.PrometheusPort,
	}).Info("Running Prometheus server")
	if err := s.ListenAndServe(); err != nil {
		log.Panic("Unable to start a prometheus server.")
	}
}

// NewPrometheusServer returns http server /metrics endpoint where metrics are served.
func NewPrometheusServer(grpcServer *grpc.Server) *PromServer {
	reg := prometheus.NewRegistry()
	grpcMetrics := grpc_prometheus.NewServerMetrics()
	reg.MustRegister(grpcMetrics)

	promServer := &http.Server{
		Handler: promhttp.HandlerFor(reg, promhttp.HandlerOpts{}),
		Addr:    fmt.Sprintf(":%s", env.PrometheusPort),
	}

	grpc_prometheus.Register(grpcServer)
	grpc_prometheus.EnableHandlingTimeHistogram()
	grpcMetrics.InitializeMetrics(grpcServer)
	// Register Prometheus metrics handler.
	http.Handle("/metrics", promhttp.Handler())

	return &PromServer{promServer}
}
