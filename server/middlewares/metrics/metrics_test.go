package metrics

import (
	"io"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/codingpot/pr12er/server/pkg/env"
	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc"
)

func TestNewPrometheusServer(t *testing.T) {
	promServer := ProvidePrometheusServer(grpc.NewServer(), &env.Config{})
	ts := httptest.NewServer(promServer.Mux)
	defer ts.Close()

	res, err := http.Get(ts.URL + "/metrics")
	assert.NoError(t, err)

	metrics, err := io.ReadAll(res.Body)
	assert.NoError(t, err)
	defer res.Body.Close()

	t.Log("/metrics has counter metrics")
	assert.True(t, strings.Contains(string(metrics), "_total"))
	t.Log("/metrics has histogram metrics")
	assert.True(t, strings.Contains(string(metrics), "_seconds"))
}
