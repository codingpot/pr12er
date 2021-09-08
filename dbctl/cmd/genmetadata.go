package cmd

import (
	"context"

	paperswithcode_go "github.com/codingpot/paperswithcode-go/v2"
	"github.com/codingpot/pr12er/dbctl/internal/config"
	"github.com/codingpot/pr12er/dbctl/internal/fetcher"
	"github.com/codingpot/pr12er/dbctl/internal/io"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"google.golang.org/api/option"
	"google.golang.org/api/youtube/v3"
)

// genMetaCmd represents the gen-meta command.
var genMetaCmd = &cobra.Command{
	Use:   "gen-meta",
	Short: "Generate database.pbtxt from the mapping_table.pbtxt",
	RunE:  generateMetadata,
}

func generateMetadata(cmd *cobra.Command, args []string) error {
	cfg := config.ProvideConfigFromViper()
	log.Info(cfg)

	// read file and unmarshal mapping file
	mappingTable, err := io.MappingTableFromFilepath(cfg.MappingFile)
	if err != nil {
		return err
	}

	// loop and make Database
	database := &pr12er.Database{
		PrIdToVideo: make(map[int32]*pr12er.PrVideo),
	}

	client, err := fetcherClient(cfg.YouTubeAPIKey)
	if err != nil {
		return err
	}

	in := make(chan *pr12er.MappingTableRow, len(mappingTable.GetRows()))
	out := make(chan *pr12er.PrVideo, len(mappingTable.GetRows()))

	startWorkers(cfg.Workers, client, in, out)
	// required for multi YouTube video fetching.
	videoIDToPrMap := beginTheJobAndPrepareVideoMap(mappingTable, in)

	close(in)

	waitUntilDatabaseUpdate(mappingTable, out, database)

	close(out)

	updateDatabaseWithYouTubeMetadata(client, videoIDToPrMap, database)

	return io.DumpDatabase(database, cfg.DatabaseOutFile)
}

func fetcherClient(apiKey string) (*fetcher.Fetcher, error) {
	youtubeService, err := youtube.NewService(context.Background(), option.WithAPIKey(apiKey))
	if err != nil {
		return nil, err
	}
	client := fetcher.New(paperswithcode_go.NewClient(), youtubeService)
	return client, nil
}

func updateDatabaseWithYouTubeMetadata(client *fetcher.Fetcher, videoIDToPrMap map[string]int32, database *pr12er.Database) {
	videos, err := client.FetchYouTubeVideos(videoIDToPrMap /*batchSize=*/, 50)
	if err != nil {
		log.WithError(err).Panic("failed to fetch multi YT videos")
	}

	for prID, video := range videos {
		database.GetPrIdToVideo()[prID].Video = video
	}
}

func waitUntilDatabaseUpdate(mappingTable *pr12er.MappingTable, out chan *pr12er.PrVideo, database *pr12er.Database) {
	for range mappingTable.GetRows() {
		prVideo := <-out

		if prVideo != nil {
			database.PrIdToVideo[prVideo.GetPrId()] = prVideo
		}
	}
}

func beginTheJobAndPrepareVideoMap(mappingTable *pr12er.MappingTable, in chan *pr12er.MappingTableRow) map[string]int32 {
	videoIDToPrMap := make(map[string]int32)
	for _, prRow := range mappingTable.GetRows() {
		in <- prRow

		if prRow.GetYoutubeVideoId() != "" {
			videoIDToPrMap[prRow.GetYoutubeVideoId()] = prRow.GetPrId()
		}
	}
	return videoIDToPrMap
}

func startWorkers(workers int, client *fetcher.Fetcher, in chan *pr12er.MappingTableRow, out chan *pr12er.PrVideo) {
	for w := 0; w < workers; w++ {
		go func(id int, in <-chan *pr12er.MappingTableRow, out chan<- *pr12er.PrVideo) {
			for row := range in {
				// only get papers information
				// we will run youtube multi fetch later
				prVideo, err := client.FetchOnlyPapers(row)
				if err != nil {
					log.WithError(err).Warn("FetchPrVideo has failed")
					// don't block so it still sends nil to out
				}
				out <- prVideo
			}
		}(w, in, out)
	}
}

// nolint: gochecknoinits
func init() {
	rootCmd.AddCommand(genMetaCmd)

	genMetaCmd.
		Flags().
		StringP(
			"mapping-file",
			"f",
			"../server/internal/data/mapping_table.pbtxt",
			"A mapping file which generate database.pbtxt from. default name is 'mapping_table.pbtxt'")
	_ = viper.BindPFlag(config.EnvNameMappingFile, genMetaCmd.Flag("mapping-file"))

	genMetaCmd.
		Flags().
		String("youtube-api-key", "", "YouTube Data API (v3) key")
	_ = viper.BindPFlag(config.EnvNameYouTubeAPIKey, genMetaCmd.Flag("youtube-api-key"))

	genMetaCmd.
		Flags().
		String("database-out-file",
			"../server/internal/data/database.pbtxt",
			"Filepath to write database.pbtxt")
	_ = viper.BindPFlag(config.EnvNameDatabaseOutFile, genMetaCmd.Flag("database-out-file"))

	genMetaCmd.
		Flags().
		Int("workers", 10, "The number of workers to use for fetching")
	_ = viper.BindPFlag(config.EnvNameWorkers, genMetaCmd.Flag("workers"))
}
