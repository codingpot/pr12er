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
