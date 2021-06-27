package cmd

import (
	"log"

	"github.com/spf13/cobra"
)

// rootCmd represents the base command when called without any subcommands.
var rootCmd = &cobra.Command{
	Use:   "dbctl",
	Short: "dbctl is a cli tool for managing metadata for PR12ER project",
	Long: `dbctl is a cli tool for managing metadata for PR12ER project.
It will generate database.pbtxt from the mapping_table.pbtxt. 
It will generate mapping_table.pbtxt from the youtube URL.
`,
}

// Execute adds all child commands to the root command and sets flags appropriately.
// This is called by main.main(). It only needs to happen once to the rootCmd.
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		log.Panic(err)
	}
}
