package serv

import (
	"fmt"
	"log"

	"golang.org/x/net/context"
)

type Server struct {
	pr12er.Pr12ErServiceServer
}

func (s *Server) GetHello(ctx context.Context, in *pr12er.HelloRequest) (*pr12er.HelloResponse, error) {
	log.Printf("Get Request Hello! body: %s", in.Body)
	return &pr12er.HelloResponse{Body: fmt.Sprintf("Hello %s", in.Body)}, nil
}
