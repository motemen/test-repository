package main

import (
	"fmt"
	"runtime"
)

const version = "0.2.8"

func main() {
	fmt.Printf("Hello, %s/%s! (%s)\n", runtime.GOOS, runtime.GOARCH, version)
}
