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
	"fmt"

	"github.com/spf13/cobra"
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

func generateMetadata(cmd *cobra.Command, args []string) {
	fmt.Println("genMeta called", mappingFile)

	// init metadata
	//unmarshal mapping file

	// loop and make Database
	/*
		message Database {
		  map<int32, PrVideo> pr_id_to_video = 1;
		}

		// PR영상의 하나의 레코드
		message PrVideo {
		  int32 pr_id = 1;
		  // 관련도에 따라 정렬
		  repeated Paper papers = 2;
		  YouTubeVideo video = 3;
		}

		// 유튜브 1편에 대한 정보
		// `pkg.pr12er.Video` 생성하기 위해 사용됩니다.
		message YouTubeVideo {
		  string video_id = 1;
		  string video_title = 2;
		  int64 number_of_likes = 3;
		  int64 number_of_views = 4;
		  google.protobuf.Timestamp published_date = 5;
		  string uploader = 6;
		}
	*/
	// 1.

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
