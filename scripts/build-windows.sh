#!/usr/bin/env bash

set -eo pipefail

sudo apt-get install -y build-essential mingw-w64
go get -u github.com/golang/dep/cmd/dep
dep ensure

export CGO_CPPFLAGS="-I $GOPATH/src/github.com/regner/albionmarket-client/thirdparty/WpdPack/Include/"
export CGO_LDFLAGS="-L $GOPATH/src/github.com/regner/albionmarket-client/thirdparty/WpdPack/Lib/x64/"
export GOOS=windows
export GOARCH=amd64
export CGO_ENABLED=0
export CXX=x86_64-w64-mingw32-g++
export CC=x86_64-w64-mingw32-gcc
go build -o albionmarket-client.exe -a -installsuffix cgo cmd/albionmarket-client/albionmarket-client.go
