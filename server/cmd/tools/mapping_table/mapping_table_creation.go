package main

import (
	"fmt"
	"github.com/codingpot/pr12er/server/internal"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"log"
	"net/http"
	"os"

	"google.golang.org/api/customsearch/v1"
	"google.golang.org/api/googleapi/transport"
	"google.golang.org/protobuf/encoding/prototext"
)

const (
	apiKey = "AIzaSyAD82dBdxsWujXYfAWFWI8MulwyUYsY5zM"
	cx     = "4fae55326ddbe865c"
	query  = "hello world"
)

func search() {
	client := &http.Client{Transport: &transport.APIKey{Key: apiKey}}

	svc, err := customsearch.New(client)
	if err != nil {
		log.Fatal(err)
	}

	resp, err := svc.Cse.List(query).Cx(cx).Q(query).Do()
	if err != nil {
		log.Fatal(err)
	}

	for i, result := range resp.Items {
		fmt.Printf("#%d: %s\n", i+1, result.Title)
		fmt.Printf("\t%s\n", result.Snippet)
	}
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

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
	check(err)

	bytes, err := prototext.Marshal(&mappingTable)
	check(err)

	_, err = f.Write(bytes)
	check(err)
}