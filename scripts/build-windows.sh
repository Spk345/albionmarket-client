#!/usr/bin/env bash

sudo apt-get install -y build-essential gcc-mingw-w64-x86-64
go get -u github.com/golang/dep/cmd/dep
dep ensure

export CGO_CPPFLAGS="-I $GOPATH/src/github.com/regner/albionmarket-client/thirdparty/WpdPack/Include/"
export CGO_LDFLAGS="-L $GOPATH/src/github.com/regner/albionmarket-client/thirdparty/WpdPack/Lib/x64/"
export GOOS=windows
export GOARCH=amd64
export CGO_ENABLED=1
export CXX=x86_64-w64-mingw32-g++
export CC=x86_64-w64-mingw32-gcc
go build -o albionmarket-client.exe -v -x cmd/albionmarket-client/albionmarket-client.go
