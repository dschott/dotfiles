#!/usr/bin/env bash

# setup PATH for this dir
DOTPATH="$(cd "$(dirname "$(readlink "${HOME}/.bashrc")")/.." && pwd)"
PATH="${DOTPATH}/bin:/usr/local/sbin:${PATH}"
export DOTPATH PATH

# load local shell config
if [ -r "${HOME}/.bashrc.local" ]
then
    . "${HOME}/.bashrc.local"
fi

# homebrew env vars
if [ -x /opt/homebrew/bin/brew ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Include homebrew completion functions
    if [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]
    then
        . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    fi
fi

# git
if command -v git > /dev/null
then
    alias g='git'
    DELTA_PAGER="less -R --tabs 4"
    DELTA_PAGER_PAGED="less -+FX -R --tabs 4 -c"
    export DELTA_PAGER DELTA_PAGER_PAGED
    complete -F _complete_alias g
fi

# docker 
if command -v docker > /dev/null
then
    alias d='docker'
    alias dc='docker compose'
fi

# golang
if command -v go > /dev/null
then
    GOPATH=${HOME}/go
    GOBIN=${GOPATH}/bin
    GO=${HOME}/go/src/github.com/
    PATH="${GOBIN}:${PATH}"
    export GOPATH GOBIN GO PATH

    complete -o nospace -C gocomplete go
fi

# java
java-version 12

# kubernetes
if command -v kubectl > /dev/null
then
    alias k='kubectl'
    complete -F _complete_alias k
fi

# make
if command -v gmake > /dev/null
then
    alias m=gmake
    alias make=gmake
    complete -F _complete_alias m
fi

if command -v aws > /dev/null
then
    complete -C "$(which aws_completer)" aws
fi

if [ -d "${HOME}/.bashrc.d/" ]
then
    for f in "${HOME}"/.bashrc.d/*; do
        if [ -f "${f}" ]; then
            . "${f}"
        fi
    done
fi

