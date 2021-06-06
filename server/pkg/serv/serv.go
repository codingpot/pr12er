package serv

import (
	"context"
	_ "embed"
	"fmt"
	"log"

	"github.com/codingpot/pr12er/server/internal"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"google.golang.org/protobuf/encoding/prototext"
)

type Server struct {
	pr12er.UnimplementedPr12ErServiceServer
}

func (s Server) GetHello(_ context.Context, in *pr12er.HelloRequest) (*pr12er.HelloResponse, error) {
	return &pr12er.HelloResponse{Body: fmt.Sprintf("Hello %s", in.Body)}, nil
}

func (s Server) GetVideos(_ context.Context, _ *pr12er.GetVideosRequest) (*pr12er.GetVideosResponse, error) {
	resp, err := getVideosFromDumpedPbtxt()
	return &resp, err
}

func getVideosFromDumpedPbtxt() (pr12er.GetVideosResponse, error) {
	var resp pr12er.GetVideosResponse
	var metadataDump pr12er.MetadataDump
	if err := prototext.Unmarshal(internal.PR12MetadataProtoText, &metadataDump); err != nil {
		log.Fatal(err)
	}

	resp.Videos = make([]*pr12er.Video, 0, len(metadataDump.Metadata))

	for _, metadata := range metadataDump.Metadata {
		var video pr12er.Video
		video.Id = metadata.GetId()
		video.Title = metadata.Title
		if len(metadata.VideoMetadata) > 0 {
			video.Link = metadata.VideoMetadata[0].Url
		}
		video.Presenter = metadata.Presenter
		// video.Category
		// video.NumberOfLike
		video.Keywords = metadata.Keywords
		resp.Videos = append(resp.Videos, &video)
	}
	return resp, nil
}
