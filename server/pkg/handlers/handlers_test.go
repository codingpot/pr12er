package handlers

import (
	"testing"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/google/go-cmp/cmp"
	"google.golang.org/protobuf/testing/protocmp"
)

// nolint:funlen
func TestConvertToGet(t *testing.T) {
	type args struct {
		db *pr12er.Database
	}
	tests := []struct {
		name string
		args args
		want *pr12er.GetVideosResponse
	}{
		{
			name: "convert pr12er.Database to GetVideosResponse in sorted order",
			args: args{
				db: &pr12er.Database{
					PrIdToVideo: map[int32]*pr12er.PrVideo{
						199: {
							PrId: 199,
							Video: &pr12er.YouTubeVideo{
								VideoId:       "video-id-199",
								VideoTitle:    "Video Title",
								NumberOfLikes: 3,
								NumberOfViews: 4,
							},
						},
						2: {
							PrId: 2,
							Video: &pr12er.YouTubeVideo{
								VideoId:       "video-id-1",
								VideoTitle:    "Video Title",
								NumberOfLikes: 1,
								NumberOfViews: 2,
							},
							Papers: []*pr12er.Paper{
								{
									PaperId: "paper-id-2",
									Title:   "paper-title-2",
									Methods: []*pr12er.Method{
										{
											Name: "Method 1",
										},
									},
								},
							},
						},
					},
				},
			},
			want: &pr12er.GetVideosResponse{
				Videos: []*pr12er.Video{
					{
						PrId:          2,
						Title:         "Video Title",
						Link:          "https://youtu.be/video-id-1",
						NumberOfLike:  1,
						NumberOfViews: 2,
						Keywords:      []string{"Method 1"},
					},
					{
						PrId:          199,
						Title:         "Video Title",
						Link:          "https://youtu.be/video-id-199",
						NumberOfLike:  3,
						NumberOfViews: 4,
					},
				},
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := VideosResponseFromDB(tt.args.db)
			if got := cmp.Diff(tt.want, got, protocmp.Transform()); got != "" {
				t.Error(got)
			}
		})
	}
}
