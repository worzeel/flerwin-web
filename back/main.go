package main

import (
	"fmt"
	"net/http"
)

func myTestPage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Test")
}

func handleRequests() {
	http.HandleFunc("/", myTestPage)
	http.ListenAndServe(":9989", nil)
}

func main() {
	handleRequests()
}
