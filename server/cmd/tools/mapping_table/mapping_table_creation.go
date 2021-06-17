package main

import (
	"github.com/codingpot/pr12er/server/internal"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"os"

	"google.golang.org/protobuf/encoding/prototext"
)

func main() {
	metadataDump := internal.ReadPR12MetadataProtoText()

	mappingTable := pr12er.MappingTable{}
	mappingTable.Rows = make([]*pr12er.MappingTableRow, 0, len(metadataDump.Metadata))

	for _, metadata := range metadataDump.Metadata {
		mappingTableRow := &pr12er.MappingTableRow{
			PrId:      metadata.GetId(),
		}

		videoMetadata := metadata.GetVideoMetadata()
		if len(videoMetadata) > 0 {
			mappingTableRow.YoutubeVideoId = videoMetadata[0].Url
		}

		mappingTable.Rows = append(mappingTable.Rows, mappingTableRow)
	}

	f, err := os.Create("test.pbtxt")
	if err != nil {
		panic(err)
	}

	bytes, err := prototext.Marshal(&mappingTable)
	if err != nil {
		panic(err)
	}

	_, err = f.Write(bytes)
	if err != nil {
		panic(err)
	}
	mappingTable.Rows = make([]*pr12er.MappingTableRow, 0, len(metadataDump.Metadata))

	for _, metadata := range metadataDump.Metadata {
		mappingTableRow := &pr12er.MappingTableRow{
			PrId:      metadata.GetId(),
		}

		videoMetadata := metadata.GetVideoMetadata()
		if len(videoMetadata) > 0 {
			mappingTableRow.YoutubeVideoId = videoMetadata[0].Url
		}

		mappingTable.Rows = append(mappingTable.Rows, mappingTableRow)
	}

	f, err := os.Create("test.pbtxt")
	if err != nil {
		panic(err)
	}

	bytes, err := prototext.Marshal(&mappingTable)
	if err != nil {
		panic(err)
	}

	_, err = f.Write(bytes)
	if err != nil {
		panic(err)
	}
}
}