#! /usr/bin/env sh

env GOOS=windows GOARCH=amd64 go build -ldflags "-w -s"
