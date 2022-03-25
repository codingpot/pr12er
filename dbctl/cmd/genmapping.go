package cmd

import (
	"context"
	"os"
	"sort"
	"time"

	"github.com/codingpot/pr12er/dbctl/internal/config"
	"github.com/codingpot/pr12er/dbctl/internal/transform"
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

var genmappingCmd = &cobra.Command{
	Use:   "gen-mapping",
	Short: "[Experimental] Generate Mapping Table from Playlist",
	RunE: func(cmd *cobra.Command, args []string) error {
		cfg := config.ProvideConfigFromViper()
		log.Info(cfg)

		// Define RateLimit: 1/sec
		if cfg.Cx == "" {
			googlesearch.RateLimit = rate.NewLimiter(rate.Every(time.Second), 3)
		}

		svc, err := youtube.NewService(context.Background(), option.WithAPIKey(cfg.YouTubeAPIKey))
		if err != nil {
			return err
		}

		var table pr12er.MappingTable

		err = svc.
			PlaylistItems.
			List([]string{"contentDetails", "snippet"}).
			PlaylistId(cfg.YouTubePlaylistID).
			Pages(context.Background(), func(resp *youtube.PlaylistItemListResponse) error {
				// rateLimiter is used for CSE search.
				rateLimiter := rate.NewLimiter(rate.Every(time.Second), 1)

				for _, item := range resp.Items {
					log.WithFields(log.Fields{
						"title": item.Snippet.Title,
					}).Info("processing a youtube video")
					prID, err := transform.ExtractPRID(item.Snippet.Title)
					if err != nil {
						log.WithError(err).Warnf("Unable to extract PR ID from %s", item.Snippet.Title)
						continue
					}

					if !(cfg.MinPrID <= prID && prID <= cfg.MaxPrID) {
						continue
					}

					var paperIDs []string

					if cfg.Cx == "" {
						paperIDs, err = transform.ExtractPaperIDs(item.Snippet.Title)
					} else {
						paperIDs, err = transform.
							ExtractPaperIDsViaProgrammableSearch(
								item.Snippet.Title,
								cfg.Cx,
								cfg.YouTubeAPIKey,
								rateLimiter)
					}
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

		sort.Slice(table.GetRows(), func(i, j int) bool {
			return table.GetRows()[i].GetPrId() < table.GetRows()[j].GetPrId()
		})

		marshal, err := prototext.MarshalOptions{
			Multiline: true,
			Indent:    "  ",
		}.Marshal(&table)
		if err != nil {
			return err
		}

		return os.WriteFile(cfg.MappingFile, marshal, 0o600)
	},
}

func init() {
	rootCmd.AddCommand(genmappingCmd)

	genmappingCmd.Flags().String("youtube-api-key", "", "YouTube API Key (required)")
	_ = viper.BindPFlag(config.EnvNameYouTubeAPIKey, genmappingCmd.Flag("youtube-api-key"))
	genmappingCmd.Flags().String("playlist-id", "", "YouTube Playlist ID (required)")
	_ = viper.BindPFlag(config.EnvNameYouTubePlaylistID, genmappingCmd.Flag("playlist-id"))
	genmappingCmd.Flags().String("mapping-file", "../server/internal/data/mapping_table.pbtxt", "Filepath to mapping_table.pbtxt")
	_ = viper.BindPFlag(config.EnvNameMappingFile, genmappingCmd.Flag("mapping-file"))
	genmappingCmd.Flags().Int32("min-pr-id", 0, "Minimum PR ID to fetch from (inclusive). It will start fetching from this ID.")
	_ = viper.BindPFlag(config.EnvNameMinPrID, genmappingCmd.Flag("min-pr-id"))
	genmappingCmd.Flags().Int32("max-pr-id", 999, "Maximum PR ID to fetch from (inclusive). It will start fetching until this PR.")
	_ = viper.BindPFlag(config.EnvNameMaxPrID, genmappingCmd.Flag("max-pr-id"))
	genmappingCmd.Flags().String("cx", "", "Search Engine ID from https://programmablesearchengine.google.com/ If this is not set, it will use googlesearch (free)")
	_ = viper.BindPFlag(config.EnvNameCx, genmappingCmd.Flag("cx"))
}
