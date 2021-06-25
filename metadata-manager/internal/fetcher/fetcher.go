// Package fetcher 는 데이터를 네트워크에서 받아오는 함수를 정의합니다.
package fetcher

import (
	"context"
	"regexp"
	"time"

	"github.com/codingpot/paperswithcode-go/v2"
	"github.com/codingpot/pr12er/metadata-manager/internal/transform"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
	"google.golang.org/api/youtube/v3"
	"google.golang.org/protobuf/types/known/timestamppb"
)

var lineEndingRegexp = regexp.MustCompile(`\r?\n`)

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
		log.WithField("arxivID", arxivID).Info("processing a paper")
		params := paperswithcode_go.PaperListParamsDefault()
		params.ArxivID = arxivID
		papers, err := f.client.PaperList(params)
		if err != nil || papers == nil {
			return nil, err
		}

		for _, paper := range papers.Results {
			paperID := paper.ID

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

			pr12erPapers = append(pr12erPapers, &pr12er.Paper{
				PaperId:      paperID,
				Title:        paper.Title,
				ArxivId:      arxivID,
				Abstract:     lineEndingRegexp.ReplaceAllString(paper.Abstract, " "),
				PublishedDate: timestamppb.New(time.Time(papers.Results[0].Published)),
				Authors:      paper.Authors,
				Repositories: repositories,
				Methods:      methods,
			})
		}
	}

	return pr12erPapers, nil
}

// FetchYouTubeVideos fetches YouTubeVideo and returns a map[PR-ID]Video.
// Because we can't send 200+ IDs requests at once, we use a wrapper function to split by batchSize.
// We need to return the map so that it can plug back to the correct PR video.
func (f *Fetcher) FetchYouTubeVideos(videoIDToPr map[string]int32, batchSize int) (map[int32]*pr12er.YouTubeVideo, error) {
	videoIDs := make([]string, len(videoIDToPr))
	i := 0
	for videoID := range videoIDToPr {
		videoIDs[i] = videoID
		i++
	}

	ret := make(map[int32]*pr12er.YouTubeVideo)

	for i := 0; i < len(videoIDs); i += batchSize {
		end := i + batchSize
		if len(videoIDs) < end {
			end = len(videoIDs)
		}

		// Get the batch response.
		videos, err := f.FetchMultiYouTubeVideoByIDs(videoIDs[i:end])
		if err != nil {
			return nil, err
		}

		for _, video := range videos {
			prID := videoIDToPr[video.GetVideoId()]
			ret[prID] = video
		}
	}

	return ret, nil
}

// FetchMultiYouTubeVideoByIDs is a low level function that returns videos by its IDs.
// If there is a next page token, it will iterate each page.
func (f *Fetcher) FetchMultiYouTubeVideoByIDs(videoIDs []string) ([]*pr12er.YouTubeVideo, error) {
	log.WithField("videoIDs", videoIDs).Info("fetching YouTube")

	part := []string{"contentDetails", "snippet", "statistics"}

	var ret []*pr12er.YouTubeVideo
	err := f.youtubeService.Videos.List(part).Id(videoIDs...).
		Pages(context.Background(), func(response *youtube.VideoListResponse) error {
			videos, err := handleResponse(response)
			if err != nil {
				return err
			}
			ret = append(ret, videos...)
			return nil
		})
	if err != nil {
		return nil, err
	}

	return ret, nil
}

func handleResponse(resp *youtube.VideoListResponse) ([]*pr12er.YouTubeVideo, error) {
	ret := make([]*pr12er.YouTubeVideo, len(resp.Items))

	for i, item := range resp.Items {
		ts, err := time.Parse(time.RFC3339, item.Snippet.PublishedAt)
		if err != nil {
			return nil, err
		}

		ret[i] = &pr12er.YouTubeVideo{
			VideoId:       item.Id,
			VideoTitle:    item.Snippet.Title,
			NumberOfLikes: int64(item.Statistics.LikeCount),
			NumberOfViews: int64(item.Statistics.ViewCount),
			PublishedDate: timestamppb.New(ts),
			Uploader:      item.Snippet.ChannelTitle,
		}
	}

	return ret, nil
}

// FetchOnlyPapers fetches papers without video information.
func (f *Fetcher) FetchOnlyPapers(prRow *pr12er.MappingTableRow) (*pr12er.PrVideo, error) {
	papers, err := f.fetchArxivPapersInfo(prRow.PaperArxivIds)
	if err != nil {
		return nil, err
	}

	return &pr12er.PrVideo{
		PrId:   prRow.GetPrId(),
		Papers: papers,
	}, nil
}
