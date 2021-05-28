package internal

import (
	_ "embed"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"google.golang.org/protobuf/encoding/prototext"
)

//go:embed pr12_metadata.pbtxt
var PR12MetadataProtoText []byte
var dump pr12er.MetadataDump

func ReadPR12MetadataProtoText() *pr12er.MetadataDump {
	return &dump
}

func init() {
	err := prototext.Unmarshal(PR12MetadataProtoText, &dump)
	if err != nil {
		panic(err)
	}
}
