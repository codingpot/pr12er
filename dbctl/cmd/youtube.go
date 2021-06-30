package cmd

import (
	"fmt"
	"time"

	"github.com/codingpot/pr12er/dbctl/internal/transform"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"golang.org/x/time/rate"
	"google.golang.org/protobuf/encoding/prototext"
)

const envNameYouTubeLink = "YOUTUBE_LINK"

// youtubeCmd represents the youtube command.
var youtubeCmd = &cobra.Command{
	Use:   "youtube",
	Short: "Generate a single GenMapping to STDOUT",
	Long: `You can run this file and redirect to the mapping file.

For example,
	go run main.go youtube --youtube-link https://www.youtube.com/watch?v=rtuJqQDWmIA >> ../server/internal/data/mapping_table.pbtxt
`,
	RunE: func(cmd *cobra.Command, args []string) error {
		apiKey := viper.GetString(envNameYouTubeAPIKey)
		youTubeLink := viper.GetString(envNameYouTubeLink)
		cx := viper.GetString(envNameCx)

		log.WithFields(log.Fields{
			envNameYouTubeAPIKey: apiKey,
			envNameYouTubeLink:   youTubeLink,
			envNameCx:            cx,
		}).Info("binding variables")

		rateLimiter := rate.NewLimiter(rate.Every(time.Second), 1)

		youtubeID, err := transform.ExtractYouTubeID(youTubeLink)
		if err != nil {
			return err
		}

		client, err := fetcherClient(apiKey)
		if err != nil {
			return err
		}

		// Get video metadata.
		youTubeVideos, err := client.FetchMultiYouTubeVideoByIDs([]string{youtubeID})
		if err != nil {
			return err
		}

		if len(youTubeVideos) != 1 {
			return fmt.Errorf("expected one video but got %v", youTubeVideos)
		}

		vid := youTubeVideos[0]

		// Get PR ID from video.
		prID, err := transform.ExtractPRID(vid.GetVideoTitle())
		if err != nil {
			return err
		}

		var paperIDs []string

		// Get paper IDs.
		if cx == "" {
			paperIDs, err = transform.ExtractPaperIDs(vid.GetVideoTitle())
		} else {
			paperIDs, err = transform.
				ExtractPaperIDsViaProgrammableSearch(
					vid.GetVideoTitle(),
					cx,
					apiKey,
					rateLimiter)
		}
		if err != nil {
			return err
		}

		data := &pr12er.MappingTable{
			Rows: []*pr12er.MappingTableRow{
				{
					PrId:           prID,
					PaperArxivIds:  paperIDs,
					YoutubeVideoId: vid.GetVideoId(),
				},
			},
		}

		bs, err := prototext.MarshalOptions{
			Multiline: true,
			Indent:    "  ",
		}.Marshal(data)
		if err != nil {
			return err
		}

		// Print to stdout
		// nolint:forbidigo
		fmt.Print(string(bs))

		return nil
	},
}

func init() {
	rootCmd.AddCommand(youtubeCmd)
	youtubeCmd.Flags().String("youtube-api-key", "", "YouTube API Key (required)")
	_ = viper.BindPFlag(envNameYouTubeAPIKey, youtubeCmd.Flag("youtube-api-key"))
	youtubeCmd.Flags().String("youtube-link", "", "YouTube Link to fetch")
	_ = viper.BindPFlag(envNameYouTubeLink, youtubeCmd.Flag("youtube-link"))
	youtubeCmd.Flags().String("cx", "", "Search Engine ID from https://programmablesearchengine.google.com/ If this is not set, it will use googlesearch (free)")
	_ = viper.BindPFlag(envNameCx, youtubeCmd.Flag("cx"))
}
