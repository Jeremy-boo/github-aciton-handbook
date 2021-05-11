package main

import (
	"jeremy-boo/github/hello/hello"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/hello", hello.HelloHandler)
	log.Fatal(http.ListenAndServe(":5000", nil))
}
