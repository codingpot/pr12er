package cmd

import (
	"context"
	"errors"
	"log"
	"os"
	"time"

	paperswithcode_go "github.com/codingpot/paperswithcode-go/v2"
	models "github.com/codingpot/paperswithcode-go/v2/models"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/spf13/cobra"
	"google.golang.org/api/option"
	"google.golang.org/api/youtube/v3"
	"google.golang.org/protobuf/encoding/prototext"
	"google.golang.org/protobuf/types/known/timestamppb"
)

const (
	defaultMappingFile  = "server/internal/data/mapping_table.pbtxt"
	defaultDatabaseFile = "server/internal/data/database.pbtxt"
)

var (
	mappingFile string
	apiKey      string
)

// genMetaCmd represents the gen-meta command
var genMetaCmd = &cobra.Command{
	Use:   "gen-meta",
	Short: "Generate database.pbtxt from the mapping_table.pbtxt",
	Long: `Generate database.pbtxt. 
Then, you can use it as a \server\internal\database.pbtxt

How to use:

$ metadata-manager gen-meta --mapping-file mapping_table.pbtxt 
$ metadata-manager gen-meta --mapping-file mapping_table.pbtxt --apikey <YouTubeDataAPIKey> # If you did not set environment variable "YOUTUBE_DATA_API_KEY"
`,
	Run: generateMetadata,
}

func frameworkToEnum(paperFramework string) pr12er.Framework {
	if paperFramework == "tf" {
		return pr12er.Framework_FRAMEWORK_TENSORFLOW
	} else if paperFramework == "pytorch" {
		return pr12er.Framework_FRAMEWORK_PYTORCH
	} else if paperFramework == "" {
		return pr12er.Framework_FRAMEWORK_UNSPECIFIED
	}
	return pr12er.Framework_FRAMEWORK_OTHERS
}

func transformRepositoriesForPaper(repositories []models.Repository) []*pr12er.Repository {
	var pr12erRepos []*pr12er.Repository
	for _, repo := range repositories {
		repo := pr12er.Repository{
			IsOfficial:    repo.IsOfficial,
			Url:           repo.URL,
			Owner:         "",
			Framework:     frameworkToEnum(repo.Framework),
			NumberOfStars: int64(repo.Stars),
			Description:   repo.Description,
		}
		pr12erRepos = append(pr12erRepos, &repo)
	}
	return pr12erRepos
}

func transformMethodsForPaper(methods []*models.Method) []*pr12er.Method {
	var pr12erMethods []*pr12er.Method
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

var c = paperswithcode_go.NewClient()

func fetchArxivPapersInfo(paperArxivIds []string) []*pr12er.Paper {
	var pr12erPapers []*pr12er.Paper

	for _, ArxivId := range paperArxivIds {
		params := paperswithcode_go.PaperListParamsDefault()
		params.ArxivID = ArxivId
		papers, err := c.PaperList(params)
		if err != nil {
			log.Printf("fail to Get paper of the Arxiv id %s\n", ArxivId)
		}

		if len(papers.Results) > 0 {
			paperId := papers.Results[0].ID

			// reference: https://pkg.go.dev/github.com/codingpot/paperswithcode-go/v2@v2.1.3/models
			repoList, err := c.PaperRepositoryList(paperId)
			if err != nil {
				log.Printf("fail to Get paper repositores of the paper id %s\n", paperId)
			}
			repositories := transformRepositoriesForPaper(repoList.Results)

			methodlist, err := c.PaperMethodList(paperId)
			if err != nil {
				log.Printf("fail to Get paper methods of the paper id %s\n", paperId)
			}
			methods := transformMethodsForPaper(methodlist.Results)

			// make paper
			paper := &pr12er.Paper{
				PaperId:  paperId,
				Title:    papers.Results[0].Title,
				ArxivId:  ArxivId,
				Abstract: papers.Results[0].Abstract,
				PubDate:  timestamppb.New(time.Time(papers.Results[0].Published)),
			}
			paper.Authors = make([]string, len(papers.Results[0].Authors))
			paper.Repositories = make([]*pr12er.Repository, len(repositories))
			paper.Methods = make([]*pr12er.Method, len(methods))
			copy(paper.Authors, papers.Results[0].Authors)
			copy(paper.Repositories, repositories)
			copy(paper.Methods, methods)

			pr12erPapers = append(pr12erPapers, paper)
		}
	}
	return pr12erPapers
}

func fetchYouTubeVideoInfo(youTubeVideoId string) *pr12er.YouTubeVideo {

	// api info: https://developers.google.com/youtube/v3/docs/videos/list
	// using package: https://pkg.go.dev/google.golang.org/api/youtube/v3
	// using API example: https://bit.ly/3dfFQPd

	apiKey = os.Getenv("YOUTUBE_DATA_API_KEY")
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
	if len(resp.Items) > 0 {
		youTubeVideo.VideoTitle = resp.Items[0].Snippet.Title

		ts, err := time.Parse(time.RFC3339, resp.Items[0].Snippet.PublishedAt)
		if err != nil {
			log.Fatal(err)
		}
		youTubeVideo.PublishedDate = timestamppb.New(ts)
		youTubeVideo.NumberOfLikes = int64(resp.Items[0].Statistics.LikeCount)
		youTubeVideo.NumberOfViews = int64(resp.Items[0].Statistics.ViewCount)
		youTubeVideo.Uploader = resp.Items[0].Snippet.ChannelTitle
	}

	return &youTubeVideo
}

func fetchPrVideo(prRow pr12er.MappingTableRow) *pr12er.PrVideo {
	prVideo := &pr12er.PrVideo{}

	papers := fetchArxivPapersInfo(prRow.PaperArxivId)
	prVideo.Papers = make([]*pr12er.Paper, len(papers))
	copy(prVideo.Papers, papers)

	prVideo.Video = fetchYouTubeVideoInfo(prRow.YoutubeVideoId)

	return prVideo
}

func generateMetadata(cmd *cobra.Command, args []string) {
	log.Println("gen-meta called", mappingFile)

	//read file and unmarshal mapping file
	b, err := os.ReadFile(mappingFile)
	if err != nil {
		log.Fatal(err)
	}

	mappingTable := pr12er.MappingTable{}
	if err := prototext.Unmarshal(b, &mappingTable); err != nil {
		log.Fatal(err)
	}

	// loop and make Database
	database := &pr12er.Database{
		PrIdToVideo: make(map[int32]*pr12er.PrVideo),
	}
	for _, prRow := range mappingTable.Rows {
		database.PrIdToVideo[prRow.PrId] = fetchPrVideo(*prRow)
	}

	log.Println("made database completely")
	// save as a .pbtxt
	b = []byte(prototext.Format(database.ProtoReflect().Interface()))
	if err := os.WriteFile(defaultDatabaseFile, b, 0600); err != nil {
		log.Fatal(err)
	}

}

func init() {
	rootCmd.AddCommand(genMetaCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// genMetaCmd.PersistentFlags().String("foo", "", "A help for foo")
	genMetaCmd.PersistentFlags().StringVarP(&mappingFile, "mapping-file", "f", defaultMappingFile, "A mapping file which generate database.pbtxt from. default name is 'mapping_table.pbtxt'")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// genMetaCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
