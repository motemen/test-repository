package main

import (
	"fmt"
	"runtime"
)

const version = "0.0.3"

func main() {
	fmt.Printf("Hello, %s/%s!\n", runtime.GOOS, runtime.GOARCH)
}
