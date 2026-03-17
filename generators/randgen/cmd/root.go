package cmd

import (
	"fmt"
	"os"
	"randgen/clip"

	"github.com/spf13/cobra"
)

const defaultLength = 32

var rootCmd = &cobra.Command{
	Use:   "randgen",
	Short: "Generate random strings, passwords, and UUIDs",
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		os.Exit(1)
	}
}

func copyIfRequested(cmd *cobra.Command, text string) {
	cp, _ := cmd.Flags().GetBool("copy")
	if cp {
		if err := clip.Copy(text); err != nil {
			fmt.Fprintln(os.Stderr, "Error copying to clipboard:", err)
			os.Exit(1)
		}
		fmt.Fprintln(os.Stderr, "Copied to clipboard!")
	}
}
