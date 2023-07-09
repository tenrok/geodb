.ONESHELL:
ifeq ($(OS),Windows_NT)
SHELL=C:/Program Files/Git/bin/bash.exe
build: windows
else
SHELL=/usr/bin/bash
build: linux
endif

windows:
	export GOOS=windows
	export GOARCH=amd64
	export CGO_ENABLED=1
	#go build -o geodbsvc.exe -a -ldflags "-extldflags=-static -w -s" -tags "osusergo,netgo,sqlite_omit_load_extension" -trimpath ./cmd/geodbsvc
	go build -o geodbsvc.exe -tags "osusergo,netgo,sqlite_omit_load_extension" -trimpath ./cmd/geodbsvc

linux:
	export GOOS=linux
	export GOARCH=amd64
	export CGO_ENABLED=1
	#go build -o geodbsvc -a -ldflags "-extldflags=-static -w -s" -tags "osusergo,netgo,sqlite_omit_load_extension" -trimpath ./cmd/geodbsvc
	go build -o geodbsvc -tags="osusergo,netgo,sqlite_omit_load_extension" -trimpath ./cmd/geodbsvc

.PHONY: build windows linux
.DEFAULT_GOAL=build
