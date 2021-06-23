package handlers

import (
	"sort"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
)

// VideosResponseFromDB converts DB proto to GetVideosResponse.
func VideosResponseFromDB(db *pr12er.Database) *pr12er.GetVideosResponse {
	videos := make([]*pr12er.Video, len(db.GetPrIdToVideo()))
	i := 0

	for prID, data := range db.GetPrIdToVideo() {
		dataVideo := data.GetVideo()
		videos[i] = &pr12er.Video{
			PrId:          prID,
			Title:         dataVideo.GetVideoTitle(),
			Link:          getYouTubeLinkFromID(dataVideo.GetVideoId()),
			Presenter:     dataVideo.GetUploader(),
			Category:      getCategory(data),
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

// TODO: Implement getCategory based on papers.
func getCategory(prVideo *pr12er.PrVideo) pr12er.Category {
	return pr12er.Category_CATEGORY_UNSPECIFIED
}

// getYouTubeLinkFromID returns the full URL.
func getYouTubeLinkFromID(videoID string) string {
	return "https://youtu.be/" + videoID
}
