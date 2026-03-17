package cmd

import (
	"fmt"
	"os"
	"randgen/gen"

	"github.com/spf13/cobra"
)

var uuidCmd = &cobra.Command{
	Use:   "uuid",
	Short: "Generate a UUID v7",
	Args:  cobra.NoArgs,
	Run:   runUUIDv7,
}

var uuidv4Cmd = &cobra.Command{
	Use:   "uuidv4",
	Short: "Generate a UUID v4",
	Args:  cobra.NoArgs,
	Run:   runUUIDv4,
}

var uuidv7Cmd = &cobra.Command{
	Use:   "uuidv7",
	Short: "Generate a UUID v7",
	Args:  cobra.NoArgs,
	Run: runUUIDv7,
}

func runUUIDv4(cmd *cobra.Command, args []string) {
	result, err := gen.UUIDv4()
	if err != nil {
		fmt.Fprintln(os.Stderr, "Error:", err)
		os.Exit(1)
	}
	fmt.Println(result)
	copyIfRequested(cmd, result)
}

func runUUIDv7(cmd *cobra.Command, args []string) {
	result, err := gen.UUIDv7()
	if err != nil {
		fmt.Fprintln(os.Stderr, "Error:", err)
		os.Exit(1)
	}
	fmt.Println(result)
	copyIfRequested(cmd, result)
}

func init() {
	uuidCmd.Flags().BoolP("copy", "c", false, "Copy result to clipboard")
	uuidv4Cmd.Flags().BoolP("copy", "c", false, "Copy result to clipboard")
	uuidv7Cmd.Flags().BoolP("copy", "c", false, "Copy result to clipboard")
	rootCmd.AddCommand(uuidCmd)
	rootCmd.AddCommand(uuidv4Cmd)
	rootCmd.AddCommand(uuidv7Cmd)
}
