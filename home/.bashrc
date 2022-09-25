#!/usr/bin/env bash

# DOTPATH
DOTPATH="$(cd "$(dirname "$(readlink "${HOME}/.bashrc")")/.." && pwd)"
PATH="${DOTPATH}/bin:/usr/local/sbin:${PATH}"
export DOTPATH

# SHELL ENV
if [ -d "${HOME}/.bashrc.d/" ]
then
    for f in "${HOME}"/.bashrc.d/*; do
        if [ -f "${f}" ]; then
            . "${f}"
        fi
    done
fi

# SHELL LOCAL ENV
if [ -r "${HOME}/.bashrc.local" ]
then
    . "${HOME}/.bashrc.local"
fi

# HOMEBREW
if [ -x /opt/homebrew/bin/brew ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Include homebrew completion functions
    if [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]
    then
        . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    fi
fi

# GIT
if command -v git > /dev/null
then
    alias g='git'
    DELTA_PAGER="less -R --tabs 4"
    DELTA_PAGER_PAGED="less -+FX -R --tabs 4 -c"
    export DELTA_PAGER DELTA_PAGER_PAGED
    complete -F _complete_alias g
fi

# DOCKER 
if command -v docker > /dev/null
then
    alias d='docker'
    alias dc='docker compose'
fi

# GO
if command -v go > /dev/null
then
    GOPATH=${HOME}/go
    GOBIN=${GOPATH}/bin
    GO=${HOME}/go/src/github.com/
    PATH="${GOBIN}:${PATH}"
    export GOPATH GOBIN GO

    complete -o nospace -C gocomplete go
fi

# JAVA
if [ -d "${HOMEBREW_PREFIX}/opt/openjdk/bin" ]
then
    PATH="${HOMEBREW_PREFIX}/opt/openjdk/bin:$PATH"
    CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/openjdk/include"
    export CPPFLAGS
fi

# KUBECTL
if command -v kubectl > /dev/null
then
    alias k='kubectl'
    complete -F _complete_alias k
fi

# MAKE
if command -v gmake > /dev/null
then
    alias m=gmake
    alias make=gmake
    complete -F _complete_alias m
fi

# AWS
if command -v aws > /dev/null
then
    complete -C "$(which aws_completer)" aws
fi

export PATH
