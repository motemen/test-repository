package main

import (
	"fmt"
	"runtime"
)

const version = "0.2.2"

// hoge
func main() {
	fmt.Printf("Hello, %s/%s!\n", runtime.GOOS, runtime.GOARCH)
}
