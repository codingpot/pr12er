package serv

import (
	"context"
	"testing"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/stretchr/testify/assert"
)

func TestGetHello(t *testing.T) {
	s := Server{}
	request := pr12er.HelloRequest{
		Body: "World",
	}
	resp, err := s.GetHello(context.Background(), &request)
	assert.NoError(t, err)
	assert.Equal(t, "Hello World", resp.GetBody())
}

func TestGetVideos(t *testing.T) {
	s := Server{}
	req := pr12er.GetVideosRequest{}
	resp, err := s.GetVideos(context.Background(), &req)

	assert.NoError(t, err)

	t.Log("it should return non empty video list.")
	assert.Greater(t, len(resp.Videos), 0)
}

func TestServer_GetDetails(t *testing.T) {
	s := Server{}
	request := pr12er.GetDetailsRequest{PrId: 1}
	got, err := s.GetDetails(context.Background(), &request)
	assert.NoError(t, err)
	assert.Equal(t, int32(1), got.GetDetail().GetPrId())
}
