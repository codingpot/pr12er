// Package fetcher 는 데이터를 네트워크에서 받아오는 함수를 정의합니다.
package fetcher

import (
	"time"

	"github.com/codingpot/paperswithcode-go/v2"
	"github.com/codingpot/pr12er/metadata-manager/internal/transform"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/sirupsen/logrus"
	"google.golang.org/api/youtube/v3"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type Fetcher struct {
	client         *paperswithcode_go.Client
	youtubeService *youtube.Service
}

func New(client *paperswithcode_go.Client, youtubeService *youtube.Service) *Fetcher {
	return &Fetcher{client: client, youtubeService: youtubeService}
}

func (f *Fetcher) fetchArxivPapersInfo(paperArxivIDs []string) ([]*pr12er.Paper, error) {
	var pr12erPapers []*pr12er.Paper

	for _, arxivID := range paperArxivIDs {
		logrus.WithField("arxivID", arxivID).Info("processing a paper")
		params := paperswithcode_go.PaperListParamsDefault()
		params.ArxivID = arxivID
		papers, err := f.client.PaperList(params)
		if err != nil || papers == nil {
			return nil, err
		}

		if len(papers.Results) > 0 {
			paperID := papers.Results[0].ID

			// reference: https://pkg.go.dev/github.com/codingpot/paperswithcode-go/v2@v2.1.3/models
			repoList, err := f.client.PaperRepositoryList(paperID)
			if err != nil || repoList == nil {
				return nil, err
			}
			repositories := transform.Repositories(repoList.Results)

			methodList, err := f.client.PaperMethodList(paperID)
			if err != nil || methodList == nil {
				return nil, err
			}
			methods := transform.Methods(methodList.Results)

			// make paper
			paper := &pr12er.Paper{
				PaperId:  paperID,
				Title:    papers.Results[0].Title,
				ArxivId:  arxivID,
				Abstract: papers.Results[0].Abstract,
				PubDate:  timestamppb.New(time.Time(papers.Results[0].Published)),
			}
			paper.Authors = papers.Results[0].Authors
			paper.Repositories = repositories
			paper.Methods = methods

			pr12erPapers = append(pr12erPapers, paper)
		}
	}

	return pr12erPapers, nil
}

func (f *Fetcher) fetchYouTubeVideoInfo(videoID string) (*pr12er.YouTubeVideo, error) {
	logrus.WithField("videoID", videoID).Info("fetching YouTube video info")

	part := []string{"contentDetails", "snippet", "statistics"}
	call := f.youtubeService.Videos.List(part).Id(videoID)
	resp, err := call.Do()
	if err != nil {
		return nil, err
	}

	// make video information
	youTubeVideo := pr12er.YouTubeVideo{}
	youTubeVideo.VideoId = videoID
	if len(resp.Items) > 0 {
		youTubeVideo.VideoTitle = resp.Items[0].Snippet.Title

		ts, err := time.Parse(time.RFC3339, resp.Items[0].Snippet.PublishedAt)
		if err != nil {
			return nil, err
		}
		youTubeVideo.PublishedDate = timestamppb.New(ts)
		youTubeVideo.NumberOfLikes = int64(resp.Items[0].Statistics.LikeCount)
		youTubeVideo.NumberOfViews = int64(resp.Items[0].Statistics.ViewCount)
		youTubeVideo.Uploader = resp.Items[0].Snippet.ChannelTitle
	}

	return &youTubeVideo, nil
}

// FetchPrVideo fetches YouTubeVideo and Papers information.
func (f *Fetcher) FetchPrVideo(prRow *pr12er.MappingTableRow) (*pr12er.PrVideo, error) {
	video, err := f.fetchYouTubeVideoInfo(prRow.YoutubeVideoId)
	if err != nil {
		return nil, err
	}

	papers, err := f.fetchArxivPapersInfo(prRow.PaperArxivId)
	if err != nil {
		return nil, err
	}

	return &pr12er.PrVideo{
		PrId:   prRow.GetPrId(),
		Papers: papers,
		Video:  video,
	}, nil
}
