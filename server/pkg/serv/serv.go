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
	h *handlers.Handler
}

func New(handler *handlers.Handler) *Server {
	return &Server{
		h: handler,
	}
}

var _ pr12er.Pr12ErServiceServer = (*Server)(nil)

func (s Server) GetDetail(_ context.Context, in *pr12er.GetDetailRequest) (*pr12er.GetDetailResponse, error) {
	return s.h.DetailResponseFromDB(in.GetPrId(), &data.DB)
}

func (s Server) GetHello(_ context.Context, in *pr12er.HelloRequest) (*pr12er.HelloResponse, error) {
	return &pr12er.HelloResponse{Body: fmt.Sprintf("Hello %s", in.Body)}, nil
}

func (s Server) GetVideos(_ context.Context, _ *pr12er.GetVideosRequest) (*pr12er.GetVideosResponse, error) {
	return s.h.VideosResponseFromDB(&data.DB), nil
}

func (s Server) Report(_ context.Context, in *pr12er.ReportRequest) (*pr12er.ReportResponse, error) {
	return s.h.Report(in)
}
