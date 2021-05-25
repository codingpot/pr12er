package serv

import (
	"context"
	"fmt"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"log"
)

type Server struct {
	pr12er.UnimplementedPr12ErServiceServer
}

func (s Server) GetHello(ctx context.Context, in *pr12er.HelloRequest) (*pr12er.HelloResponse, error) {
	log.Printf("Get Request Hello! body: %s", in.Body)
	return &pr12er.HelloResponse{Body: fmt.Sprintf("Hello %s", in.Body)}, nil
}

func (s Server) GetVideos(ctx context.Context, request *pr12er.GetVideosRequest) (*pr12er.GetVideosResponse, error) {
	panic("implement me")
}
