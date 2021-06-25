package prutils

import (
	"testing"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/stretchr/testify/assert"
)

func TestCategoryFromVideo(t *testing.T) {
	type args struct {
		prVideo *pr12er.PrVideo
	}
	tests := []struct {
		name string
		args args
		want pr12er.Category
	}{
		{
			name: "Recommender Systems should return RS category",
			args: args{
				prVideo: &pr12er.PrVideo{Video: &pr12er.YouTubeVideo{
					VideoTitle: "PR-064: Wide & Deep Learning for Recommender Systems",
				}},
			},
			want: pr12er.Category_CATEGORY_RS,
		},
		{
			name: "Audio paper should return Audio category",
			args: args{
				prVideo: &pr12er.PrVideo{Video: &pr12er.YouTubeVideo{
					VideoTitle: "PR-067: Audio Super Resolution using Neural Nets",
				}},
			},
			want: pr12er.Category_CATEGORY_AUDIO,
		},
		{
			name: "Vision paper returns Vision category",
			args: args{
				prVideo: &pr12er.PrVideo{
					Video: &pr12er.YouTubeVideo{
						VideoTitle: "PR-084 MegDet: A Large Mini-Batch Object Detector",
					},
				},
			},
			want: pr12er.Category_CATEGORY_VISION,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := CategoryFromVideo(tt.args.prVideo)
			assert.Equalf(t, tt.want, got, "want %s, got %s", tt.want, got)
		})
	}
}
