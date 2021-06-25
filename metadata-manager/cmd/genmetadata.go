package cmd

import (
	"context"

	paperswithcode_go "github.com/codingpot/paperswithcode-go/v2"
	"github.com/codingpot/pr12er/metadata-manager/internal/fetcher"
	"github.com/codingpot/pr12er/metadata-manager/internal/io"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"google.golang.org/api/option"
	"google.golang.org/api/youtube/v3"
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
	mappingTable, err := io.MappingTableFromFilepath(mappingFile)
	if err != nil {
		return err
	}

	// loop and make Database
	database := &pr12er.Database{
		PrIdToVideo: make(map[int32]*pr12er.PrVideo),
	}

	client, err := fetcherClient(apiKey)
	if err != nil {
		return err
	}

	in := make(chan *pr12er.MappingTableRow, len(mappingTable.GetRows()))
	out := make(chan *pr12er.PrVideo, len(mappingTable.GetRows()))

	startWorkers(workers, client, in, out)
	// required for multi youtube video fetching.
	videoIDToPrMap := beginTheJobAndPrepareVideoMap(mappingTable, in)

	close(in)

	waitUntilDatabaseUpdate(mappingTable, out, database)

	close(out)

	updateDatabaseWithYouTubeMetadata(client, videoIDToPrMap, database)

	return io.DumpDatabase(database, databaseOutFile)
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
