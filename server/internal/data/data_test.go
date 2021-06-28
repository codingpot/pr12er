package data

import (
	"regexp"
	"sort"
	"strconv"
	"strings"
	"testing"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/encoding/prototext"
)

func TestValidMappingTable(t *testing.T) {
	bs, err := pbFiles.ReadFile("mapping_table.pbtxt")
	assert.NoError(t, err)

	// Unmarshalled correctly.
	var table pr12er.MappingTable
	err = prototext.Unmarshal(bs, &table)
	assert.NoError(t, err)

	// Sorted by PR ID.
	sort.SliceIsSorted(table.GetRows(), func(i, j int) bool {
		return table.GetRows()[i].GetPrId() < table.GetRows()[j].GetPrId()
	})

	// PR ID and Video ID must exist.
	for _, row := range table.GetRows() {
		assert.Greater(t, row.GetPrId(), int32(0))
	}
}

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
