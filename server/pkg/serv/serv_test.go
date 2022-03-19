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

func TestServer_GetDetail(t *testing.T) {
	type args struct {
		// nolint:containedctx
		ctx context.Context
		req *pr12er.GetDetailRequest
	}
	tests := []struct {
		name    string
		args    args
		want    *pr12er.GetDetailResponse
		wantErr bool
	}{
		{
			name: "Returns an error if the PR is not found with the given ID",
			args: args{
				ctx: context.Background(),
				req: &pr12er.GetDetailRequest{
					PrId: 0,
				},
			},
			want:    nil,
			wantErr: true,
		},
		{
			name: "Returns a valid response if the PR is found",
			args: args{
				ctx: context.Background(),
				req: &pr12er.GetDetailRequest{PrId: 1},
			},
			want: &pr12er.GetDetailResponse{Detail: &pr12er.Detail{
				PrId: 1,
			}},
			wantErr: false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := Server{}
			got, err := s.GetDetail(tt.args.ctx, tt.args.req)
			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				assert.Equal(t, tt.want.GetDetail().GetPrId(), got.GetDetail().GetPrId())
				assert.Greater(t, len(got.GetDetail().GetPapers()), 0)
			}
		})
	}
}
