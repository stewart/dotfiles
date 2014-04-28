package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

const (
	gifs_folder = "/Users/stewart/Dropbox/Pictures/gifs"
	url_base    = "http://gifs.stwrt.ca/"
	alphabet    = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
)

func main() {
	args := os.Args[1:]

	if len(args) == 0 {
		quit("No argument provided.")
	}

	search_term := args[0]
	results := searchForGifs(search_term)

	if len(results) == 0 {
		quit("No results found. Try another search.")
	}

	if len(results) > len(alphabet) {
		quit("Way too many results found. Try a less vague search.")
	}

	var result string

	if len(results) == 1 {
		result = results[0]
	} else {
		result = pickResult(results)
	}

	url := url_base + result
	copyToClipboard(url)
	quit("Copied " + url + " to clipboard.")
}

func quit(reason string) {
	fmt.Println(reason)
	os.Exit(0)
}

func searchForGifs(term string) []string {
	search := gifs_folder + "/*" + term + "*"
	matches, err := filepath.Glob(search)

	if err != nil {
		quit("Error occured while searching for gifs.")
	}

	for i, match := range matches {
		matches[i] = filepath.Base(match)
	}

	return matches
}

func pickResult(choices []string) string {
	split_alphabet := strings.Split(alphabet, "")[:len(choices)]

	fmt.Println("Take your pick:")

	for i, letter := range split_alphabet {
		fmt.Println("  ", letter+":", choices[i])
	}

	var input string
	_, err := fmt.Scanf("%s", &input)

	if err != err {
		quit("Error getting user input.")
	}

	input = strings.ToUpper(input)

	var result string

	for i, letter := range split_alphabet {
		if letter == input {
			result = choices[i]
			break
		}
	}

	return result
}

func copyToClipboard(str string) {
	command := fmt.Sprintf("echo %s | pbcopy", str)

	cmd := exec.Command("/bin/sh", "-c", command)
	cmd.Run()
}
