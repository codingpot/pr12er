package cmd

import (
	"encoding/json"
	"fmt"
	"log"
	"testing"
	"time"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/types/known/timestamppb"
)

func TestFetchArxivPapersInfo(t *testing.T) {
	arxivID := []string{"1505.07818"}
	papers := fetchArxivPapersInfo(arxivID)

	expectedType := "[]*pr12er.Paper"
	if _, err := json.MarshalIndent(papers, "", "  "); err != nil {
		log.Fatal(err)
	}
	actualType := fmt.Sprintf("%T", papers)
	assert.Equal(t, expectedType, actualType)
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
	actualVideo := fetchYouTubeVideoInfo(youtubeID, "API_KEY")

	assert.Equal(t, expectedVideo.VideoId, actualVideo.VideoId)
	assert.Equal(t, expectedVideo.VideoTitle, actualVideo.VideoTitle)
	assert.Equal(t, expectedVideo.PublishedDate, actualVideo.PublishedDate)
	assert.Equal(t, expectedVideo.Uploader, actualVideo.Uploader)
}
