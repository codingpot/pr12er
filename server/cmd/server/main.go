package main

import (
	"fmt"
	"log"
	"net"

	"github.com/codingpot/pr12er/server/pkg/env"
	"github.com/codingpot/pr12er/server/pkg/serv"

	pb "github.com/codingpot/pr12er/server/pkg/protos/hello"

	"google.golang.org/grpc"
)

func main() {

	fmt.Printf("gRPC server(version: %s) is listening at 0.0.0.0:%s\n", env.Nversion, env.ServiceAddress)

	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", env.ServicePort))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := serv.Server{}

	grpcServer := grpc.NewServer()

	pb.RegisterPr12ErServiceServer(grpcServer, &s)

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}
}
