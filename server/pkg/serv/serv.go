package serv

import (
	"context"
	"fmt"
	"time"

	"github.com/codingpot/pr12er/server/internal"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type Server struct {
	pr12er.UnsafePr12ErServiceServer
}

var _ pr12er.Pr12ErServiceServer = (*Server)(nil)

func (s Server) GetDetails(_ context.Context, in *pr12er.GetDetailsRequest) (*pr12er.GetDetailsResponse, error) {
	// Returns details of this ID
	searchPRID := in.GetPrId()

	resp := &pr12er.GetDetailsResponse{
		Detail: &pr12er.Detail{
			PrId: searchPRID,
			Paper: []*pr12er.Paper{
				{
					PaperId: "1",
					// nolint: lll
					Abstract: "We propose a new framework for estimating generative models via an adversarial process, in which we simultaneously train two models: a generative model G that captures the data distribution, and a discriminative model D that estimates the probability that a sample came from the training data rather than G. The training procedure for G is to maximize the probability of D making a mistake. This framework corresponds to a minimax two-player game. In the space of arbitrary functions G and D, a unique solution exists, with G recovering the training data distribution and D equal to 1/2 everywhere. In the case where G and D are defined by multilayer perceptrons, the entire system can be trained with backpropagation. There is no need for any Markov chains or unrolled approximate inference networks during either training or generation of samples. Experiments demonstrate the potential of the framework through qualitative and quantitative evaluation of the generated samples.",
					Repositories: []*pr12er.Repository{
						{
							Framework: pr12er.Framework_FRAMEWORK_TENSORFLOW,
							Owner:     "goodfeli",
						},
						{
							Framework: pr12er.Framework_FRAMEWORK_PYTORCH,
							Owner:     "eriklindernoren",
						},
						{
							Framework: pr12er.Framework_FRAMEWORK_TENSORFLOW,
							Owner:     "google-research",
						},
						{
							Framework: pr12er.Framework_FRAMEWORK_PYTORCH,
							Owner:     "eriklindernoren",
						},
					},
				},
			},
			SameAuthorPapers: []*pr12er.Paper{
				{
					Title:   "On distinguishability criteria for estimating generative models",
					Authors: []string{"Ian J. Goodfellow"},
					PubDate: timestamppb.New(newDate(2015, 5, 21)),
				},
			},
			RelevantPapers: []*pr12er.Paper{
				{
					Title:   "Learning to Efficiently Sample from Diffusion Probabilistic Models",
					Authors: []string{"Daniel Watson"},
					PubDate: timestamppb.New(newDate(2021, 6, 7)),
				},
			},
		},
	}

	return resp, nil
}

// A little helper function to create a Ymd.
func newDate(y int, m time.Month, d int) time.Time {
	return time.Date(y, m, d, 0, 0, 0, 0, time.UTC)
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
			PrId:      metadata.GetId(),
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
