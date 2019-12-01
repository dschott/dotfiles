#!/usr/bin/env bash

if check-command -q go; then
    export GOPATH=${HOME}/go
    export GOBIN=${GOPATH}/bin
    export GO=${HOME}/go/src/github.com/
    path-add "${GOBIN}"

    complete -C gocomplete go
fi
