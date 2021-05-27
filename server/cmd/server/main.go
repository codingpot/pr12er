package main

import (
	"fmt"
	"log"
	"net"

	"github.com/codingpot/pr12er/server/pkg/env"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/codingpot/pr12er/server/pkg/serv"

	"google.golang.org/grpc"
	"google.golang.org/grpc/health"
	"google.golang.org/grpc/health/grpc_health_v1"
	"google.golang.org/grpc/reflection"
)

func main() {

	fmt.Printf("gRPC server(version: %s) is listening at 0.0.0.0:%s\n", env.Nversion, env.ServicePort)

	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", env.ServicePort))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := serv.Server{}

	grpcServer := grpc.NewServer()

	pr12er.RegisterPr12ErServiceServer(grpcServer, &s)

	healthServer := health.NewServer()
	healthServer.SetServingStatus("grpc.health.v1.pr12erservice", grpc_health_v1.HealthCheckResponse_SERVING)
	grpc_health_v1.RegisterHealthServer(grpcServer, healthServer)

	reflection.Register(grpcServer)

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}
}
