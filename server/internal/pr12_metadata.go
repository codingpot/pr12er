package internal

import (
	_ "embed"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"google.golang.org/protobuf/encoding/prototext"
)

var (
	//go:embed pr12_metadata.pbtxt
	// PR12MetadataProtoText is embedded for easier read.
	PR12MetadataProtoText []byte
	dump                  pr12er.MetadataDump
)

func ReadPR12MetadataProtoText() *pr12er.MetadataDump {
	return &dump
}

// nolint:gochecknoinits
func init() {
	err := prototext.Unmarshal(PR12MetadataProtoText, &dump)
	if err != nil {
		panic(err)
	}
}
