package mapping_table

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestGetYoutubeId(t *testing.T) {
	youtubeLink := "https://youtu.be/L3hz57whyNw"
	youtubeId := getLastBitsFrom(youtubeLink)

	assert.Equal(t, "L3hz57whyNw", youtubeId)
}

func TestGetArxivId(t *testing.T) {
	arxivLink := "https://arxiv.org/abs/1406.2661"
	arxivId := getLastBitsFrom(arxivLink)

	assert.Equal(t, "1406.2661", arxivId)
}