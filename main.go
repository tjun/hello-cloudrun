package main

import (
	"fmt"
	"net/http"
	"os"
)

const defaultPort = "8080"

func main() {
	http.HandleFunc("/", handle)

	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}
	http.ListenAndServe(":"+port, nil)
}

func handle(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "hello world")
}
