#!/usr/bin/env bash

[ -z "$(command -v go)" ] && return

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO=$HOME/go/src/github.com/
export PATH=$GOBIN:$PATH

complete -C gocomplete go
