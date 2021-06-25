package serv

import (
	"context"
	"fmt"

	"github.com/codingpot/pr12er/server/internal/data"
	"github.com/codingpot/pr12er/server/pkg/handlers"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
)

type Server struct {
	pr12er.UnsafePr12ErServiceServer
}

var _ pr12er.Pr12ErServiceServer = (*Server)(nil)

func (s Server) GetDetail(_ context.Context, in *pr12er.GetDetailRequest) (*pr12er.GetDetailResponse, error) {
	return handlers.DetailResponseFromDB(in.GetPrId(), &data.DB)
}

func (s Server) GetHello(_ context.Context, in *pr12er.HelloRequest) (*pr12er.HelloResponse, error) {
	return &pr12er.HelloResponse{Body: fmt.Sprintf("Hello %s", in.Body)}, nil
}

func (s Server) GetVideos(_ context.Context, _ *pr12er.GetVideosRequest) (*pr12er.GetVideosResponse, error) {
	return handlers.VideosResponseFromDB(&data.DB), nil
}
