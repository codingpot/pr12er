package main

import (
	"fmt"
	"log"
	"net"

	"github.com/codingpot/pr12er/server/pkg/serv"

	pb "github.com/codingpot/pr12er/server/pkg/protos/hello"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {

	lis, err := net.Listen("tcp", fmt.Sprintf(":%d", 9000))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := serv.Server{}

	grpcServer := grpc.NewServer()

	pb.RegisterPr12ErServiceServer(grpcServer, &s)
	reflection.Register(grpcServer)

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}
}
