package cmd

import (
	"context"
	"os"
	"time"

	"github.com/codingpot/pr12er/metadata-manager/internal/transform"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	googlesearch "github.com/rocketlaunchr/google-search"
	log "github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"golang.org/x/time/rate"
	"google.golang.org/api/option"
	"google.golang.org/api/youtube/v3"
	"google.golang.org/protobuf/encoding/prototext"
)

const envNameYouTubePlaylistID = "YOUTUBE_PLAYLIST_ID"

var genmappingCmd = &cobra.Command{
	Use:   "gen-mapping",
	Short: "[Experimental] Generate Mapping Table from Playlist",
	RunE: func(cmd *cobra.Command, args []string) error {
		youtubeAPIKey := viper.GetString(envNameYouTubeAPIKey)
		youtubePlaylistID := viper.GetString(envNameYouTubePlaylistID)
		mappingFilepath := viper.GetString(envNameMappingFile)

		log.WithFields(log.Fields{
			envNameYouTubeAPIKey:     youtubeAPIKey,
			envNameYouTubePlaylistID: youtubePlaylistID,
			envNameMappingFile:       mappingFilepath,
		}).Info("binding variables")

		// Define RateLimit
		// 3 / seconds
		googlesearch.RateLimit = rate.NewLimiter(rate.Every(time.Second), 3)

		svc, err := youtube.NewService(context.Background(), option.WithAPIKey(youtubeAPIKey))
		if err != nil {
			return err
		}

		var table pr12er.MappingTable

		err = svc.
			PlaylistItems.
			List([]string{"contentDetails", "snippet"}).
			PlaylistId(youtubePlaylistID).
			Pages(context.Background(), func(resp *youtube.PlaylistItemListResponse) error {
				for _, item := range resp.Items {
					log.WithFields(log.Fields{
						"title": item.Snippet.Title,
					}).Info("processing a youtube video")
					prID, err := transform.ExtractPRID(item.Snippet.Title)
					if err != nil {
						return err
					}

					paperIDs, err := transform.ExtractPaperIDs(item.Snippet.Title)
					if err != nil {
						return err
					}

					table.Rows = append(table.Rows, &pr12er.MappingTableRow{
						PrId:           prID,
						PaperArxivIds:  paperIDs,
						YoutubeVideoId: item.ContentDetails.VideoId,
					})
				}

				return nil
			})

		if err != nil {
			return err
		}

		marshal, err := prototext.MarshalOptions{
			Multiline: true,
			Indent:    "  ",
		}.Marshal(&table)
		if err != nil {
			return err
		}

		return os.WriteFile(mappingFilepath, marshal, 0o600)
	},
}

func init() {
	rootCmd.AddCommand(genmappingCmd)

	genmappingCmd.Flags().String("youtube-api-key", "", "YouTube API Key (required)")
	_ = viper.BindPFlag(envNameYouTubeAPIKey, genmappingCmd.Flag("youtube-api-key"))

	genmappingCmd.Flags().String("playlist-id", "", "YouTube Playlist ID (required)")
	_ = viper.BindPFlag(envNameYouTubePlaylistID, genmappingCmd.Flag("playlist-id"))

	genmappingCmd.Flags().String("mapping-file", "../server/internal/data/mapping_table.pbtxt", "Filepath to mapping_table.pbtxt")
	_ = viper.BindPFlag(envNameMappingFile, genmappingCmd.Flag("mapping-file"))
}
