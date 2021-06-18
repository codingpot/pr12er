package mappingtable

import (
	"log"
	"os"

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
			mappingTableRow.YoutubeVideoId = getLastBitsFrom(videoMetadata[0].Url)
		}

		mappingTableRow.PaperArxivId = make([]string, 0, 1)
		mappingTableRow.PaperArxivId = append(mappingTableRow.PaperArxivId, searchArxivID(apiKey, metadata.GetTitle()))

		mappingTable.Rows = append(mappingTable.Rows, mappingTableRow)
	}

	f, err := os.Create("mappingtable.pbtxt")
	if err != nil {
		log.Fatal(err)
	}

	marshalOption := prototext.MarshalOptions{Multiline: true}
	bytes, err := marshalOption.Marshal(&mappingTable)
	if err != nil {
		log.Fatal(err)
	}

	_, err = f.Write(bytes)
	if err != nil {
		log.Fatal(err)
	}
}
