package serv

import (
	"context"
	"fmt"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
)

type Server struct {
	pr12er.UnimplementedPr12ErServiceServer
}

func (s Server) GetHello(_ context.Context, in *pr12er.HelloRequest) (*pr12er.HelloResponse, error) {
	log.Printf("Get Request Hello! body: %s", in.Body)
	return &pr12er.HelloResponse{Body: fmt.Sprintf("Hello %s", in.Body)}, nil
}

func (s Server) GetVideos(_ context.Context, _ *pr12er.GetVideosRequest) (*pr12er.GetVideosResponse, error) {
	// TODO: Replace it with the actual logic.
	resp := getDummyData()
	return &resp, nil
}

// TODO: Remove when the actual logic is available.
func getDummyData() pr12er.GetVideosResponse {
	return pr12er.GetVideosResponse{
		Videos: []*pr12er.Video{
			{
				Id:           1,
				Link:         "https://youtu.be/L3hz57whyNw",
				NumberOfLike: 10,
				Presenter:    "유재준",
				Title:        "Generative Adversarial Nets",
				Category:     pr12er.Category_CATEGORY_VISION,
			},
			{
				Id:           2,
				Link:         "https://youtu.be/RRwaz0fBQ0Y",
				NumberOfLike: 10,
				Presenter:    "엄태웅",
				Title:        "Deformable Convolutional Networks",
				Category:     pr12er.Category_CATEGORY_VISION,
			},
			{
				Id:           3,
				Link:         "https://youtu.be/_Dp8u97_rQ0",
				NumberOfLike: 10,
				Presenter:    "곽근봉",
				Title:        "Learning Phrase Representations using RNN Encoder-Decoder for Statistical Machine Translation",
				Category:     pr12er.Category_CATEGORY_NLP,
			},
			{
				Id:           4,
				Link:         "https://youtu.be/1jGr_OFyfa0",
				NumberOfLike: 10,
				Presenter:    "전태균",
				Title:        "Image Super-Resolution using Deep Convolutional Neural Networks",
				Category:     pr12er.Category_CATEGORY_VISION,
			},
			{
				Id:           5,
				Link:         "https://youtu.be/V7_cNTfm2i8",
				NumberOfLike: 10,
				Presenter:    "김성훈",
				Title:        "Playing Atari with Deep Reinforcement Learning",
				Category:     pr12er.Category_CATEGORY_UNSPECIFIED,
			},
			{
				Id:           6,
				Link:         "https://youtu.be/2wbDiZCWQtY",
				NumberOfLike: 10,
				Presenter:    "서기호",
				Title:        "Neural Turing Machines",
				Category:     pr12er.Category_CATEGORY_UNSPECIFIED,
			},
		},
	}
}
