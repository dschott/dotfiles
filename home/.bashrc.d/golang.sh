#!/usr/bin/env bash

! command-exists go && return

export GOPATH=${HOME}/go
export GOBIN=${GOPATH}/bin
export GO=${HOME}/go/src/github.com/
path-add "${GOBIN}"

complete -C gocomplete go
