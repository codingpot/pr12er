package main

import (
	"io/ioutil"
	"log"

	"github.com/codingpot/pr12er/server/cmd/tools/mappingtable/mappingtable"
	"github.com/codingpot/pr12er/server/internal"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"google.golang.org/protobuf/encoding/prototext"
)

var apiKeyPools = []string{
	"api-key #1",
	"api-key #2",
	"api-key #3",
	"api-key #4",
}

func main() {
	metadataDump := internal.ReadPR12MetadataProtoText()

	mappingTable := pr12er.MappingTable{}
	mappingTable.Rows = make([]*pr12er.MappingTableRow, 0, len(metadataDump.Metadata))

	for idx, metadata := range metadataDump.Metadata {
		apiKey := apiKeyPools[idx/100]

		mappingTableRow := &pr12er.MappingTableRow{
			PrId: metadata.GetId(),
		}

		videoMetadata := metadata.GetVideoMetadata()
		if len(videoMetadata) > 0 {
			mappingTableRow.YoutubeVideoId = mappingtable.GetLastBitsFrom(videoMetadata[0].Url)
		}

		arxivID := mappingtable.SearchArxivID(apiKey, metadata.GetTitle())
		mappingTableRow.PaperArxivId = make([]string, 0, 1)
		mappingTableRow.PaperArxivId = append(mappingTableRow.PaperArxivId, arxivID)

		mappingTable.Rows = append(mappingTable.Rows, mappingTableRow)

		if idx == 0 {
			break
		}
	}

	marshalOption := prototext.MarshalOptions{Multiline: true}
	bytes, err := marshalOption.Marshal(&mappingTable)
	if err != nil {
		log.Panic(err)
	}
	if err = ioutil.WriteFile("test.pbtxt", bytes, 0o644); err != nil {
		log.Panic(err)
	}
}
