package hello

import (
	"fmt"
	"net/http"
)

// HelloHandler hello api
func HelloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello ok")
}
