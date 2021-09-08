// Package handlers provide functions used to handle gRPC.
package handlers

import (
	"errors"
	"sort"

	"github.com/codingpot/pr12er/server/internal/err"
	"github.com/codingpot/pr12er/server/pkg/handlers/gh"
	"github.com/codingpot/pr12er/server/pkg/handlers/prutils"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
)

// Handler depends on gh.GitHubService interface.
type Handler struct {
	gh gh.GitHubService
}

func ProvideHandler(service gh.GitHubService) *Handler {
	return &Handler{gh: service}
}

// VideosResponseFromDB converts DB proto to GetVideosResponse.
func (h *Handler) VideosResponseFromDB(db *pr12er.Database) *pr12er.GetVideosResponse {
	videos := make([]*pr12er.Video, len(db.GetPrIdToVideo()))
	i := 0

	for prID, data := range db.GetPrIdToVideo() {
		dataVideo := data.GetVideo()
		videos[i] = &pr12er.Video{
			PrId:          prID,
			Title:         dataVideo.GetVideoTitle(),
			Link:          getYouTubeLinkFromID(dataVideo.GetVideoId()),
			Presenter:     dataVideo.GetUploader(),
			Category:      prutils.CategoryFromVideo(data),
			NumberOfLike:  dataVideo.GetNumberOfLikes(),
			Keywords:      getKeywords(data),
			NumberOfViews: dataVideo.GetNumberOfViews(),
			PublishedDate: dataVideo.GetPublishedDate(),
		}
		i++
	}

	sort.Slice(videos, func(i, j int) bool {
		return videos[i].GetPrId() < videos[j].GetPrId()
	})

	return &pr12er.GetVideosResponse{
		Videos: videos,
	}
}

// DetailResponseFromDB builds DetailResponse from Database.
func (h *Handler) DetailResponseFromDB(prID int32, db *pr12er.Database) (*pr12er.GetDetailResponse, error) {
	video, ok := db.GetPrIdToVideo()[prID]
	if !ok {
		return nil, err.PrIDNotFoundError{PrID: prID}
	}

	return &pr12er.GetDetailResponse{
		Detail: &pr12er.Detail{
			PrId:   prID,
			Papers: video.GetPapers(),
		},
	}, nil
}

// Report handles when a client sends a bug report or a missing PR video report.
func (h *Handler) Report(in *pr12er.ReportRequest) (*pr12er.ReportResponse, error) {
	var issue *gh.GitHubIssue
	var e error

	switch in.GetType() {
	case pr12er.ReportRequest_REPORT_TYPE_BUG:
		issue, e = h.gh.CreateIssue("버그 리포트", in.GetBody(), []string{"bug"})
	case pr12er.ReportRequest_REPORT_TYPE_MISSING_PR_VIDEO:
		issue, e = h.gh.CreateIssue("PR12 누락 동영상", in.GetBody(), []string{"data"})
	case pr12er.ReportRequest_REPORT_TYPE_UNSPECIFIED:
		issue, e = h.gh.CreateIssue("기타", in.GetBody(), nil)
	default:
		e = errors.New("this bug report type is not supported")
	}

	if issue == nil || e != nil {
		return nil, e
	}
	return &pr12er.ReportResponse{IssueUrl: issue.URL}, e
}

// getKeywords returns all keywords by merging each paper's methods.
func getKeywords(prVideo *pr12er.PrVideo) []string {
	var ret []string
	for _, p := range prVideo.GetPapers() {
		for _, m := range p.GetMethods() {
			ret = append(ret, m.GetName())
		}
	}
	return ret
}

// getYouTubeLinkFromID returns the full URL.
func getYouTubeLinkFromID(videoID string) string {
	return "https://youtu.be/" + videoID
}
