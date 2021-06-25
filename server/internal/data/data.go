package data

import (
	"embed"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"google.golang.org/protobuf/encoding/prototext"
)

//go:embed *.pbtxt
var pbFiles embed.FS

// DB contains all PrVideos.
var DB pr12er.Database

//nolint:gochecknoinits
// we want to fail at the boot.
func init() {
	bs, err := pbFiles.ReadFile("database.pbtxt")
	if err != nil {
		panic(err)
	}

	err = prototext.Unmarshal(bs, &DB)
	if err != nil {
		panic(err)
	}
}
