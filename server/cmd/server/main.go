package main

import (
	"fmt"
	"net"

	"github.com/codingpot/pr12er/server/internal/ghv3"
	"github.com/codingpot/pr12er/server/middlewares/healthserver"
	"github.com/codingpot/pr12er/server/middlewares/metrics"
	"github.com/codingpot/pr12er/server/pkg/env"
	"github.com/codingpot/pr12er/server/pkg/handlers"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/codingpot/pr12er/server/pkg/serv"
	grpc_logrus "github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus"
	grpc_ctxtags "github.com/grpc-ecosystem/go-grpc-middleware/tags"
	grpc_prometheus "github.com/grpc-ecosystem/go-grpc-prometheus"
	log "github.com/sirupsen/logrus"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	log.WithFields(
		log.Fields{
			"ServicePort":    env.ServicePort,
			"GITHUB_API_KEY": env.GitHubAPIKey,
		}).Print("gRPC server is listening")

	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", env.ServicePort))
	if err != nil {
		log.WithError(err).Fatalf("failed to listen")
	}

	githubService := ghv3.New(env.GitHubAPIKey)
	handler := handlers.New(githubService)
	s := serv.New(handler)

	logNewEntry := log.NewEntry(log.New())

	grpcServer := grpc.NewServer(
		grpc.ChainUnaryInterceptor(
			grpc_ctxtags.UnaryServerInterceptor(grpc_ctxtags.WithFieldExtractor(grpc_ctxtags.CodeGenRequestFieldExtractor)),
			grpc_logrus.UnaryServerInterceptor(logNewEntry),
			grpc_prometheus.UnaryServerInterceptor,
		),
		grpc.ChainStreamInterceptor(
			grpc_ctxtags.StreamServerInterceptor(grpc_ctxtags.WithFieldExtractor(grpc_ctxtags.CodeGenRequestFieldExtractor)),
			grpc_logrus.StreamServerInterceptor(logNewEntry),
			grpc_prometheus.StreamServerInterceptor,
		),
	)

	pr12er.RegisterPr12ErServiceServer(grpcServer, s)
	healthserver.RegisterHealthServer(grpcServer)
	reflection.Register(grpcServer)

	// prometheus
	promServer := metrics.NewPrometheusServer(grpcServer)
	// Start your http server for prometheus.
	go func() {
		promServer.Start()
	}()

	if err := grpcServer.Serve(lis); err != nil {
		log.WithError(err).Panic("failed to serve")
	}
}
