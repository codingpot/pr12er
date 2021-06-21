/*
Copyright © 2021 NAME HERE <EMAIL ADDRESS>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
package cmd

import (
	"context"
	"errors"
	"fmt"
	"log"
	"os"
	"time"

	paperswithcode_go "github.com/codingpot/paperswithcode-go/v2"
	models "github.com/codingpot/paperswithcode-go/v2/models"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/golang/protobuf/proto"
	"github.com/spf13/cobra"
	"google.golang.org/api/option"
	"google.golang.org/api/youtube/v3"
	"google.golang.org/protobuf/types/known/timestamppb"
)

var mappingFile string

// genMetaCmd represents the genMeta command
var genMetaCmd = &cobra.Command{
	Use:   "gen-meta",
	Short: "Generate pr12_metadata_<yymmdd-hhmmss>.pbtxt",
	Long: `Generate pr12_metadata_<yymmdd-hhmmss>.pbtxt on \metadata-manager directory
Then, you can use it as a \server\internal\pr12_metadata.pbtxt

How to use:

$ metadata-manager --mapping-file mapping_table.pbtxt
`,
	Run: generateMetadata,
}

func transformRepositoriesForPaper(repositories []models.Repository) []*pr12er.Repository {
	pr12erRepos := make([]*pr12er.Repository, len(repositories))
	for _, repo := range repositories {
		fmt.Println("repo.Framework:", repo.Framework)
		repo := pr12er.Repository{
			IsOfficial: repo.IsOfficial,
			Url:        repo.URL,
			Owner:      "",
			// Framework:     repo.Framework,
			NumberOfStars: int64(repo.Stars),
			Description:   repo.Description,
		}
		pr12erRepos = append(pr12erRepos, &repo)
	}
	return pr12erRepos
}

func transformMethodsForPaper(methods []*models.Method) []*pr12er.Method {

	// Name
	// FullName
	// Description
	pr12erMethods := make([]*pr12er.Method, len(methods))
	for _, method := range methods {
		pr12erMethod := pr12er.Method{
			Name:        method.Name,
			FullName:    method.FullName,
			Description: method.Description,
		}
		pr12erMethods = append(pr12erMethods, &pr12erMethod)
	}
	return pr12erMethods
}

func fetchArxivPapersInfo(paperArxivIds []string) []*pr12er.Paper {
	pr12erPapers := make([]*pr12er.Paper, len(paperArxivIds))

	c := paperswithcode_go.NewClient()
	for _, ArxivId := range paperArxivIds {
		params := paperswithcode_go.PaperListParamsDefault()
		params.ArxivID = ArxivId
		papers, err := c.PaperList(params)
		if err != nil {
			log.Printf("fail to Get paper of the Arxiv id %s\n", ArxivId)
		}

		paperId := papers.Results[0].ID

		// https://pkg.go.dev/github.com/codingpot/paperswithcode-go/v2@v2.1.3/models
		repolist, err := c.PaperRepositoryList(paperId)
		if err != nil {
			log.Printf("fail to Get paper repos of the paper id %s\n", paperId)
		}
		repositories := transformRepositoriesForPaper(repolist.Results)

		methodlist, err := c.PaperMethodList(paperId)
		if err != nil {
			log.Printf("fail to Get paper methods of the paper id %s\n", paperId)
		}
		methods := transformMethodsForPaper(methodlist.Results)

		// make paper
		paper := pr12er.Paper{}
		paper.PaperId = papers.Results[0].ID
		paper.Title = papers.Results[0].Title
		paper.ArxivId = ArxivId
		paper.Abstract = papers.Results[0].Abstract
		paper.PubDate = timestamppb.New(time.Time(papers.Results[0].Published))
		paper.Authors = make([]string, len(papers.Results[0].Authors))
		paper.Repositories = make([]*pr12er.Repository, repolist.Count)
		paper.Methods = make([]*pr12er.Method, methodlist.Count)
		copy(paper.Authors, papers.Results[0].Authors)
		copy(paper.Repositories, repositories)
		copy(paper.Methods, methods)

		pr12erPapers = append(pr12erPapers, &paper)
	}
	return pr12erPapers
}

func fetchYouTubeVideoInfo(youTubeVideoId string) *pr12er.YouTubeVideo {

	// api info: https://developers.google.com/youtube/v3/docs/videos/list
	// part: id, snippet, contentDetails, fileDetails,
	//       liveStreamingDetails, player, processingDetails, recordingDetails,
	//       statistics, status, suggestions, topicDetails

	// contentDetails.duration: "PT35M5S"
	// snippet.publishedAt: 2017-04-16T14:24:02Z
	// snippet.title: "title": "PR-001: Generative adversarial nets by Jaejun Yoo (2017/4/13)"
	// statistics.viewCount likeCount, dislikeCount, favoriteCount, commentCount

	// use the package: https://pkg.go.dev/google.golang.org/api/youtube/v3
	// using API example: https://bit.ly/3dfFQPd

	apiKey := os.Getenv("YouTubeDataAPIV3Key")
	if apiKey == "" {
		log.Fatal(errors.New("no YouTube API Key"))
	}

	ctx := context.Background()
	youtubeService, err := youtube.NewService(ctx, option.WithAPIKey(apiKey))
	if err != nil {
		log.Fatal(err)
	}

	part := []string{"contentDetails", "snippet", "statistics"}
	call := youtubeService.Videos.List(part).Id(youTubeVideoId)
	resp, err := call.Do()
	if err != nil {
		log.Fatalf("Error making API call for videos: %v", err.Error())
	}

	// make video information
	youTubeVideo := pr12er.YouTubeVideo{}
	youTubeVideo.VideoId = youTubeVideoId
	youTubeVideo.VideoTitle = resp.Items[0].Snippet.Title

	ts, err := time.Parse(time.RFC3339, resp.Items[0].Snippet.PublishedAt)
	if err != nil {
		log.Fatal(err)
	}
	youTubeVideo.PublishedDate = timestamppb.New(ts)
	youTubeVideo.NumberOfLikes = int64(resp.Items[0].Statistics.LikeCount)
	youTubeVideo.NumberOfViews = int64(resp.Items[0].Statistics.ViewCount)
	youTubeVideo.Uploader = resp.Items[0].Snippet.ChannelTitle

	return &youTubeVideo
}

func fetchPrVideo(prRow pr12er.MappingTableRow) *pr12er.PrVideo {
	var prVideo *pr12er.PrVideo

	prVideo.Papers = fetchArxivPapersInfo(prRow.PaperArxivId)
	prVideo.Video = fetchYouTubeVideoInfo(prRow.YoutubeVideoId)
	return prVideo
}

func generateMetadata(cmd *cobra.Command, args []string) {
	fmt.Println("genMeta called", mappingFile)

	//read file and unmarshal mapping file
	b, err := os.ReadFile(mappingFile)
	if err != nil {
		log.Fatal(err)
	}

	mappingTable := pr12er.MappingTable{}
	if err := proto.Unmarshal(b, &mappingTable); err != nil {
		log.Fatal(err)
	}

	// loop and make Database
	database := &pr12er.Database{}
	for i, prRow := range mappingTable.Rows {
		_ = i
		database.PrIdToVideo[prRow.PrId] = fetchPrVideo(*prRow)
	}

}

func init() {
	rootCmd.AddCommand(genMetaCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// genMetaCmd.PersistentFlags().String("foo", "", "A help for foo")
	genMetaCmd.PersistentFlags().StringVar(&mappingFile, "mapping-file", "", "A mapping file which generate pr12_metadata_<yymmdd-hhmmss>.pbtxt from")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// genMetaCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
