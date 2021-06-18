package mappingtable

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetYoutubeID(t *testing.T) {
	youtubeLink := "https://youtu.be/L3hz57whyNw"
	youtubeID := GetLastBitsFrom(youtubeLink)

	assert.Equal(t, "L3hz57whyNw", youtubeID)
}

func TestGetArxivID(t *testing.T) {
	arxivLink := "https://arxiv.org/abs/1406.2661"
	arxivID := GetLastBitsFrom(arxivLink)

	assert.Equal(t, "1406.2661", arxivID)
}
