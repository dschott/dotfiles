#!/usr/bin/env zsh

# DOTPATH
DOTPATH="$(cd "$(dirname "$(readlink "${HOME}/.zshrc")")/.." && pwd)"
PATH="${DOTPATH}/bin:/usr/local/sbin:${PATH}"
export DOTPATH

# SHELL ENV
if [ -d "${HOME}/.zshrc.d/" ]
then
    for f in "${HOME}"/.zshrc.d/*; do
        if [ -f "${f}" ]; then
            . "${f}"
        fi
    done
fi

# SHELL LOCAL ENV
if [ -r "${HOME}/.zshrc.local" ]
then
    . "${HOME}/.zshrc.local"
fi

# HOMEBREW
if [ -x /opt/homebrew/bin/brew ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Include homebrew completion functions
    fpath+="$(brew --prefix)/share/zsh/site-functions"
fi

# GIT
if command -v git > /dev/null
then
    alias g='git'
    DELTA_PAGER="less -R --tabs 4"
    DELTA_PAGER_PAGED="less -+FX -R --tabs 4 -c"
    export DELTA_PAGER DELTA_PAGER_PAGED
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
fi

# MAKE
if command -v gmake > /dev/null
then
    alias m=gmake
    alias make=gmake
fi

# COMPLETION
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# GO COMPLETION
if command -v go > /dev/null
then
    complete -o nospace -C gocomplete go
fi

# SSH-AGENT
ssh-agent-start() {
    if [ ! -S ~/.ssh/ssh_auth_sock ]
    then
        eval $(ssh-agent -a ~/.ssh/ssh_auth_sock) > /dev/null
        echo ${SSH_AGENT_PID} > ~/.ssh/ssh_agent.pid
        echo "SSH agent started: ${SSH_AGENT_PID}"
        ssh-add
    else
        SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
        export SSH_AUTH_SOCK

        if [ -r ~/.ssh/ssh_agent.pid ]
        then
            SSH_AGENT_PID=$(cat ~/.ssh/ssh_agent.pid)
            export SSH_AGENT_PID
        fi
    fi
}
ssh-agent-start

export PATH
