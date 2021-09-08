package config

import (
	"fmt"

	"github.com/spf13/viper"
)

const (
	EnvNameCx                = "CX"
	EnvNameDatabaseOutFile   = "DATABASE_OUT_FILE"
	EnvNameMappingFile       = "MAPPING_FILE"
	EnvNameMaxPrID           = "MAX_PR_ID"
	EnvNameMinPrID           = "MIN_PR_ID"
	EnvNameWorkers           = "WORKERS"
	EnvNameYouTubeAPIKey     = "YOUTUBE_API_KEY"
	EnvNameYouTubeLink       = "YOUTUBE_LINK"
	EnvNameYouTubePlaylistID = "YOUTUBE_PLAYLIST_ID"
)

type Config struct {
	Cx                string
	DatabaseOutFile   string
	MappingFile       string
	MaxPrID           int32
	MinPrID           int32
	Workers           int
	YouTubeAPIKey     string
	YouTubeLink       string
	YouTubePlaylistID string
}

func (c *Config) String() string {
	return fmt.Sprintf(`Config{
Cx:                %q
DatabaseOutFile:   %q
MappingFile:       %q
MaxPrID:           %d
MinPrID:           %d
Workers:           %d
YouTubeAPIKey:     %q
YouTubeLink:       %q
YouTubePlaylistID: %q
}`,
		c.Cx,
		c.DatabaseOutFile,
		c.MappingFile,
		c.MaxPrID,
		c.MinPrID,
		c.Workers,
		c.YouTubeAPIKey,
		c.YouTubeLink,
		c.YouTubePlaylistID,
	)
}

func ProvideConfigFromViper() *Config {
	return &Config{
		Cx:                viper.GetString(EnvNameCx),
		DatabaseOutFile:   viper.GetString(EnvNameDatabaseOutFile),
		MappingFile:       viper.GetString(EnvNameMappingFile),
		MaxPrID:           viper.GetInt32(EnvNameMaxPrID),
		MinPrID:           viper.GetInt32(EnvNameMinPrID),
		Workers:           viper.GetInt(EnvNameWorkers),
		YouTubeAPIKey:     viper.GetString(EnvNameYouTubeAPIKey),
		YouTubeLink:       viper.GetString(EnvNameYouTubeLink),
		YouTubePlaylistID: viper.GetString(EnvNameYouTubePlaylistID),
	}
}
