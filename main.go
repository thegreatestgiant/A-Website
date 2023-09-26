package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
)

func main() {
	home := os.Getenv("HOME")
	// files, err := os.ReadDir(home)
	// if err != nil {
	// 	log.Fatal(err)
	// }
	err := filepath.Walk(home+"/.config",
		func(path string, _ os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			fmt.Println(path)
			return nil
		})
	if err != nil {
		log.Fatal(err)
	}
}
