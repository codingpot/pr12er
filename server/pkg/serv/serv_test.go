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
	t.Skip("Remove this when GetVideos() implemented")

	s := Server{}
	req := pr12er.GetVideosRequest{}
	resp, err := s.GetVideos(context.Background(), &req)

	assert.NoError(t, err)

	t.Log("it should return non empty video list.")
	assert.Greater(t, 0, len(resp.Videos))
}
