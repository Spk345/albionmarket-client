#!/usr/bin/env bash

set -eo pipefail

sudo apt-get install -y build-essential libpcap-dev
go get -u github.com/golang/dep/cmd/dep
dep ensure

export GOOS=darwin
export GOARCH=amd64
go build cmd/albionmarket-client/albionmarket-client.go
