package serv

import (
	"context"
	"fmt"

	"github.com/codingpot/pr12er/server/internal"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
)

type Server struct {
	pr12er.UnimplementedPr12ErServiceServer
}

func (s Server) GetHello(_ context.Context, in *pr12er.HelloRequest) (*pr12er.HelloResponse, error) {
	return &pr12er.HelloResponse{Body: fmt.Sprintf("Hello %s", in.Body)}, nil
}

func (s Server) GetVideos(_ context.Context, _ *pr12er.GetVideosRequest) (*pr12er.GetVideosResponse, error) {
	return getVideosFromDumpedPbtxt()
}

func getVideosFromDumpedPbtxt() (*pr12er.GetVideosResponse, error) {
	var resp pr12er.GetVideosResponse
	metadataDump := internal.ReadPR12MetadataProtoText()

	resp.Videos = make([]*pr12er.Video, 0, len(metadataDump.Metadata))

	for _, metadata := range metadataDump.Metadata {
		video := &pr12er.Video{
			Id:        metadata.GetId(),
			Title:     metadata.GetTitle(),
			Presenter: metadata.GetPresenter(),
			Keywords:  metadata.GetKeywords(),

			// TODO: Update category and number of likes.
			Category:     pr12er.Category_CATEGORY_UNSPECIFIED,
			NumberOfLike: 0,
		}

		videoMetadata := metadata.GetVideoMetadata()
		if len(videoMetadata) > 0 {
			video.Link = videoMetadata[0].Url
		}

		resp.Videos = append(resp.Videos, video)
	}
	return &resp, nil
}
