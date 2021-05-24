package serv

import (
	"log"

	pb "github.com/codingpot/pr12er/pkg/protos"

	"golang.org/x/net/context"
)

type Server struct {
	pb.Pr12ErServiceServer
}

func (s *Server) GetHello(ctx context.Context, in *pb.HelloRequest) (*pb.HelloResponse, error) {
	log.Printf("Get Request Hello! body: %s", in.Body)
	return &pb.HelloResponse{Body: "Hello From the Server!"}, nil
}
