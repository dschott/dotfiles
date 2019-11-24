#!/usr/bin/env bash

shopt -s checkwinsize
shopt -s cdspell
shopt -s dirspell
shopt -s extglob
shopt -s histappend
shopt -s globstar

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

if os-is-darwin; then
    export CLICOLOR=1
    
    if [[ -e "/usr/local/share/bash-completion/bash_completion" ]]; then
        export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
        # shellcheck disable=SC1091
        source "/usr/local/share/bash-completion/bash_completion"
    elif [[ -e "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
        # shellcheck disable=SC1091
        source "/usr/local/etc/profile.d/bash_completion.sh"
    elif [[ -e "/etc/bash_completion" ]]; then
        # shellcheck disable=SC1091
        source "/etc/bash_completion"
    fi

elif os-is-linux; then
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
            # shellcheck disable=SC1091
            . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
            # shellcheck disable=SC1091
            . /etc/bash_completion
        fi
    fi
fi
