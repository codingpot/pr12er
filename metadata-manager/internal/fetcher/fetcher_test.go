package fetcher

import (
	"testing"
	"time"

	"github.com/codingpot/paperswithcode-go/v2"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func TestFetchArxivPapersInfo(t *testing.T) {
	arxivID := []string{"1505.07818"}

	c := New(paperswithcode_go.NewClient(), nil)
	papers, err := c.fetchArxivPapersInfo(arxivID)
	assert.NoError(t, err)
	assert.Equal(t, 1, len(papers))
}

func TestFetchYouTubeVideoInfo(t *testing.T) {
	t.Skip("TODO: Replace YOUTUBE API with a mock")
	youtubeID := "L3hz57whyNw"

	ts, _ := time.Parse(time.RFC3339, "2017-04-22T05:36:37Z")
	expectedVideo := &pr12er.YouTubeVideo{
		VideoId:       youtubeID,
		VideoTitle:    "PR-001: Generative adversarial nets by Jaejun Yoo (2017/4/13)",
		PublishedDate: timestamppb.New(ts),
		Uploader:      "Sung Kim",
	}

	c := New(paperswithcode_go.NewClient(), nil)
	actualVideo, err := c.fetchYouTubeVideoInfo(youtubeID)
	assert.NoError(t, err)

	assert.Equal(t, expectedVideo.VideoId, actualVideo.VideoId)
	assert.Equal(t, expectedVideo.VideoTitle, actualVideo.VideoTitle)
	assert.Equal(t, expectedVideo.PublishedDate, actualVideo.PublishedDate)
	assert.Equal(t, expectedVideo.Uploader, actualVideo.Uploader)
}
