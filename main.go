package main

import (
	"fmt"
	"log"
	"mast-core"
	"os"
)

func main() {
	var api mast.API
	var err error
	if err = api.Init(); err != nil {
		fmt.Printf("Error: %v\n", err)
		os.Exit(1)
	}
	defer api.DB.Close()
	api.DB.LogMode(true)
	api.DB.SetLogger(log.New(os.Stdout, "\r\n", 0))

	api.Run()
}
