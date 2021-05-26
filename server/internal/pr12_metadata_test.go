package internal

import (
	"testing"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/encoding/prototext"
)

func TestEmbededFileCanBeRead(t *testing.T) {
	var metadataDump pr12er.MetadataDump
	err := prototext.Unmarshal(PR12MetadataProtoText, &metadataDump)
	assert.NoError(t, err)
	assert.Equal(t, int32(1), metadataDump.Metadata[0].Id)
	assert.Equal(t, "Jaejun Yoo", metadataDump.Metadata[0].Presenter)
}
