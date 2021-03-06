#!/usr/bin/env bash

shopt -s checkwinsize
shopt -s cdspell
shopt -s dirspell
shopt -s extglob
shopt -s globstar

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

case "$(uname -s)" in
Darwin)
    export CLICOLOR=1

    alias less='less -R'
    alias more='more -R'
    alias ag='ag --color'
    
    if [[ -e "/usr/local/share/bash-completion/bash_completion" ]]; then
        export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
        source "/usr/local/share/bash-completion/bash_completion"
    elif [[ -e "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
        source "/usr/local/etc/profile.d/bash_completion.sh"
    elif [[ -e "/etc/bash_completion" ]]; then
        source "/etc/bash_completion"
    fi
    ;;

Linux)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    if [ -x /usr/bin/dircolors ]; then
        ( test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" ) || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

    if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
            . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
        fi
    fi
    ;;
esac
