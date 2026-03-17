package cmd

import (
	"fmt"
	"os"
	"randgen/gen"
	"strconv"

	"github.com/spf13/cobra"
)

var pwdCmd = &cobra.Command{
	Use:   "pwd [length]",
	Short: "Generate a random password",
	Args:  cobra.MaximumNArgs(1),
	Run: func(cmd *cobra.Command, args []string) {
		length := defaultLength
		if len(args) > 0 {
			n, err := strconv.Atoi(args[0])
			if err != nil || n <= 0 {
				fmt.Fprintln(os.Stderr, "Error: length must be a positive integer")
				os.Exit(1)
			}
			length = n
		}
		result, err := gen.RandomString(length, gen.Password)
		if err != nil {
			fmt.Fprintln(os.Stderr, "Error:", err)
			os.Exit(1)
		}
		fmt.Println(result)
		copyIfRequested(cmd, result)
	},
}

func init() {
	pwdCmd.Flags().BoolP("copy", "c", false, "Copy result to clipboard")
	rootCmd.AddCommand(pwdCmd)
}
