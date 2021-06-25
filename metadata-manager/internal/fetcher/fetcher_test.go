package fetcher

import (
	"context"
	"os"
	"testing"

	"github.com/codingpot/paperswithcode-go/v2"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/assert"
	"google.golang.org/api/option"
	"google.golang.org/api/youtube/v3"
	"google.golang.org/protobuf/testing/protocmp"
)

func TestFetchArxivPapersInfo(t *testing.T) {
	arxivID := []string{"1505.07818"}

	c := New(paperswithcode_go.NewClient(), nil)
	papers, err := c.fetchArxivPapersInfo(arxivID)
	assert.NoError(t, err)
	assert.Equal(t, 1, len(papers))
}

func TestFetcher_FetchMultipleYouTubeVideoIDs(t *testing.T) {
	t.SkipNow()
	type args struct {
		videoIDs []string
	}

	tests := []struct {
		name    string
		args    args
		want    []*pr12er.YouTubeVideo
		wantErr bool
	}{
		{
			name: "Returns multiple vidoes",
			args: args{
				videoIDs: []string{
					"iQVvhLxGAt8",
					"Kgh88DLHHTo",
				},
			},
			want: []*pr12er.YouTubeVideo{
				{
					VideoId:    "iQVvhLxGAt8",
					VideoTitle: "PR-326: VICReg: Variance-Invariance-Covariance Regularization for Self-Supervised Learning",
					Uploader:   "만끽 MaanGeek",
				},
				{
					VideoId:    "Kgh88DLHHTo",
					VideoTitle: "PR-325: Pixel-BERT: Aligning Image Pixels with Text by Deep Multi-Modal Transformers",
					Uploader:   "Sunghoon Joo",
				},
			},
			wantErr: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			youtubeService, _ := youtube.NewService(context.Background(),
				option.WithAPIKey(os.Getenv("YOUTUBE_API_KEY")))

			f := &Fetcher{
				client:         paperswithcode_go.NewClient(),
				youtubeService: youtubeService,
			}
			got, err := f.FetchMultiYouTubeVideoByIDs(tt.args.videoIDs)

			if tt.wantErr {
				assert.Error(t, err)
			} else {
				assert.NoError(t, err)
				if diff := cmp.Diff(tt.want, got,
					protocmp.IgnoreFields(&pr12er.YouTubeVideo{},
						"number_of_likes", "number_of_views", "published_date"),
					protocmp.Transform()); diff != "" {
					t.Error(diff)
				}
			}
		})
	}
}
