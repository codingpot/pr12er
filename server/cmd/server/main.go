package main

import (
	"fmt"
	"log"
	"net"

	"github.com/codingpot/pr12er/pkg/serv"

	pb "github.com/codingpot/pr12er/pkg/protos"

	"google.golang.org/grpc"
)

func main() {

	lis, err := net.Listen("tcp", fmt.Sprintf(":%d", 9000))
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
