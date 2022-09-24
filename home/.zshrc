#!/usr/bin/env zsh

# setup PATH for this dir
DOTPATH="$(cd "$(dirname "$(readlink "${HOME}/.zshrc")")/.." && pwd)"
PATH="${DOTPATH}/bin:/usr/local/sbin:${PATH}"
export DOTPATH PATH

# load local shell config
if [ -r "${HOME}/.zshrc.local" ]
then
    . "${HOME}/.zshrc.local"
fi

# homebrew env vars
if [ -x /opt/homebrew/bin/brew ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Include homebrew completion functions
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi

# git
if command -v git > /dev/null
then
    alias g='git'
    DELTA_PAGER="less -R --tabs 4"
    DELTA_PAGER_PAGED="less -+FX -R --tabs 4 -c"
    export DELTA_PAGER DELTA_PAGER_PAGED
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
fi

# java
java-version 12

# kubernetes
if command -v kubectl > /dev/null
then
    alias k='kubectl'
fi

# make
if command -v gmake > /dev/null
then
    alias m=gmake
    alias make=gmake
fi

# Init native zsh completion (uses fpath var)
autoload -Uz compinit && compinit

# Init support for bash completion
autoload -U +X bashcompinit && bashcompinit

# go completion
if command -v go > /dev/null
then
    complete -o nospace -C gocomplete go
fi

if [ -d "${HOME}/.zshrc.d/" ]
then
    for f in "${HOME}"/.zshrc.d/*; do
        if [ -f "${f}" ]; then
            . "${f}"
        fi
    done
fi

