package cmd

import (
	"context"
	"os"
	"time"

	paperswithcode_go "github.com/codingpot/paperswithcode-go/v2"
	"github.com/codingpot/paperswithcode-go/v2/models"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"google.golang.org/api/option"
	"google.golang.org/api/youtube/v3"
	"google.golang.org/protobuf/encoding/prototext"
	"google.golang.org/protobuf/types/known/timestamppb"
)

// required environment variables.
const (
	envNameYouTubeAPIKey   = "YOUTUBE_API_KEY"
	envNameMappingFile     = "MAPPING_FILE"
	envNameDatabaseOutFile = "DATABASE_OUT_FILE"
	envNameWorkers         = "WORKERS"
)

// genMetaCmd represents the gen-meta command.
var genMetaCmd = &cobra.Command{
	Use:   "gen-meta",
	Short: "Generate database.pbtxt from the mapping_table.pbtxt",
	RunE:  generateMetadata,
}

func frameworkToEnum(paperFramework string) pr12er.Framework {
	//nolint: gocritic
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
	pr12erRepos := make([]*pr12er.Repository, len(repositories))

	for idx, repo := range repositories {
		pr12erRepos[idx] = &pr12er.Repository{
			IsOfficial:    repo.IsOfficial,
			Url:           repo.URL,
			Owner:         "",
			Framework:     frameworkToEnum(repo.Framework),
			NumberOfStars: int64(repo.Stars),
			Description:   repo.Description,
		}
	}
	return pr12erRepos
}

func transformMethodsForPaper(methods []*models.Method) []*pr12er.Method {
	pr12erMethods := make([]*pr12er.Method, len(methods))
	for idx, method := range methods {
		pr12erMethods[idx] = &pr12er.Method{
			Name:        method.Name,
			FullName:    method.FullName,
			Description: method.Description,
		}
	}
	return pr12erMethods
}

var c = paperswithcode_go.NewClient()

func fetchArxivPapersInfo(paperArxivIDs []string) []*pr12er.Paper {
	var pr12erPapers []*pr12er.Paper

	for _, arxivID := range paperArxivIDs {
		log.WithField("arxivID", arxivID).Info("processing a paper")
		params := paperswithcode_go.PaperListParamsDefault()
		params.ArxivID = arxivID
		papers, err := c.PaperList(params)
		if err != nil || papers == nil {
			log.Printf("fail to Get paper of the Arxiv id %s\n", arxivID)
			continue
		}

		if len(papers.Results) > 0 {
			paperID := papers.Results[0].ID

			// reference: https://pkg.go.dev/github.com/codingpot/paperswithcode-go/v2@v2.1.3/models
			repoList, err := c.PaperRepositoryList(paperID)
			if err != nil || repoList == nil {
				log.Printf("fail to Get paper repositores of the paper id %s\n", paperID)
				continue
			}
			repositories := transformRepositoriesForPaper(repoList.Results)

			methodList, err := c.PaperMethodList(paperID)
			if err != nil || methodList == nil {
				log.Printf("failed to get paper methods of the paper id %s\n", paperID)
				continue
			}
			methods := transformMethodsForPaper(methodList.Results)

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
	return pr12erPapers
}

func fetchYouTubeVideoInfo(videoID string, apiKey string) *pr12er.YouTubeVideo {
	log.WithField("videoID", videoID).Info("fetching YouTube video info")
	// api info: https://developers.google.com/youtube/v3/docs/videos/list
	// using package: https://pkg.go.dev/google.golang.org/api/youtube/v3
	// using API example: https://bit.ly/3dfFQPd
	ctx := context.Background()
	youtubeService, err := youtube.NewService(ctx, option.WithAPIKey(apiKey))
	if err != nil {
		log.Fatal(err)
	}

	part := []string{"contentDetails", "snippet", "statistics"}
	call := youtubeService.Videos.List(part).Id(videoID)
	resp, err := call.Do()
	if err != nil {
		log.Fatalf("Error making API call for videos: %v", err.Error())
	}

	// make video information
	youTubeVideo := pr12er.YouTubeVideo{}
	youTubeVideo.VideoId = videoID
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

func fetchPrVideo(prRow *pr12er.MappingTableRow, apiKey string) *pr12er.PrVideo {
	return &pr12er.PrVideo{
		PrId:   prRow.GetPrId(),
		Papers: fetchArxivPapersInfo(prRow.PaperArxivId),
		Video:  fetchYouTubeVideoInfo(prRow.YoutubeVideoId, apiKey),
	}
}

func generateMetadata(cmd *cobra.Command, args []string) error {
	apiKey := viper.GetString(envNameYouTubeAPIKey)
	mappingFile := viper.GetString(envNameMappingFile)
	databaseOutFile := viper.GetString(envNameDatabaseOutFile)
	workers := viper.GetInt(envNameWorkers)

	log.WithFields(log.Fields{
		envNameMappingFile:     mappingFile,
		envNameYouTubeAPIKey:   apiKey,
		envNameDatabaseOutFile: databaseOutFile,
		envNameWorkers:         workers,
	}).WithField(envNameYouTubeAPIKey, apiKey).Info("bind variables")

	// read file and unmarshal mapping file
	b, err := os.ReadFile(mappingFile)
	if err != nil {
		return err
	}

	var mappingTable pr12er.MappingTable
	if err := prototext.Unmarshal(b, &mappingTable); err != nil {
		return err
	}

	// loop and make Database
	database := &pr12er.Database{
		PrIdToVideo: make(map[int32]*pr12er.PrVideo),
	}

	in := make(chan *pr12er.MappingTableRow, len(mappingTable.GetRows()))
	out := make(chan *pr12er.PrVideo, len(mappingTable.GetRows()))

	for w := 0; w < workers; w++ {
		go func(id int, in <-chan *pr12er.MappingTableRow, out chan<- *pr12er.PrVideo) {
			for row := range in {
				out <- fetchPrVideo(row, apiKey)
			}
		}(w, in, out)
	}

	for _, prRow := range mappingTable.GetRows() {
		in <- prRow
	}

	close(in)

	for range mappingTable.GetRows() {
		prVideo := <-out
		database.PrIdToVideo[prVideo.GetPrId()] = prVideo
	}

	close(out)

	bs, err := prototext.MarshalOptions{
		Multiline: true,
		Indent:    "  ",
	}.Marshal(database)
	if err != nil {
		return err
	}
	// save as a .pbtxt
	err = os.WriteFile(databaseOutFile, bs, 0o600)
	return err
}

// nolint: gochecknoinits
func init() {
	rootCmd.AddCommand(genMetaCmd)
	viper.AutomaticEnv()

	genMetaCmd.PersistentFlags().StringP(
		"mapping-file",
		"f",
		"../server/internal/data/mapping_table.pbtxt",
		"A mapping file which generate database.pbtxt from. default name is 'mapping_table.pbtxt'")
	_ = viper.BindPFlag(envNameMappingFile, genMetaCmd.PersistentFlags().Lookup("mapping-file"))

	genMetaCmd.
		PersistentFlags().
		String("youtube-api-key", "", "YouTube Data API (v3) key")
	_ = viper.BindPFlag(envNameYouTubeAPIKey, genMetaCmd.PersistentFlags().Lookup("youtube-api-key"))

	genMetaCmd.
		PersistentFlags().
		String("database-out-file",
			"../server/internal/data/database.pbtxt",
			"Filepath to write database.pbtxt")
	_ = viper.BindPFlag(envNameDatabaseOutFile, genMetaCmd.PersistentFlags().Lookup("database-out-file"))

	genMetaCmd.PersistentFlags().Int("workers", 10, "The number of workers to use for fetching")
	_ = viper.BindPFlag(envNameWorkers, genMetaCmd.PersistentFlags().Lookup("workers"))
}
