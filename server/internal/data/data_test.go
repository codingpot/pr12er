package data

import (
	"regexp"
	"strconv"
	"strings"
	"testing"

	"github.com/stretchr/testify/assert"
)

// TestValidData validates data integrity of the database.
func TestValidData(t *testing.T) {
	r := regexp.MustCompile(`pr-?(\d+)`)

	for prID, video := range DB.GetPrIdToVideo() {
		// Every video should have PR ID set.
		assert.Equal(t, prID, video.GetPrId())

		title := strings.ToLower(video.GetVideo().GetVideoTitle())
		if title != "" {
			ret := r.FindStringSubmatch(title)
			assert.Equal(t, len(ret), 2)

			// nolint: gosec
			atoi, err := strconv.Atoi(ret[1])
			if err != nil {
				assert.NoError(t, err)
			}

			// Every video's title should contain PR-XXX that matches PR-ID.
			// WARNING: it's fragile. The title format may change in the future.
			assert.Equal(t, prID, int32(atoi))
		}
	}
}
