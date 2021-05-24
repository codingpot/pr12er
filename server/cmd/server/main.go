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

	fmt.Printf("Grpc server start! ver: %s\n", env.Nversion)

	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", env.ServiceAddress))
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
