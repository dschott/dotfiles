#!/usr/bin/env bash

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Shell
export CLICOLOR=1
export CLICOLOR=GxFxCxDxBxegedabagaced
shopt -s checkwinsize

# Prompt
RED="\[\033[0;31m\]"
GRAY="\[\033[0;90m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
PS1="${RED}[${GRAY}\u@\h ${RED}] ${RED}\$(date +%H:%M) \w${YELLOW} \$(git-whichbranch)${GREEN}\n\$ "

RED="\033[0;31m"
GREEN="\033[0;32m"
printf "${GREEN}---------------------------------------------------------------
${RED}
            ▄▄▄▄    ▄▄▄        ██████  ██░ ██ 
           ▓█████▄ ▒████▄    ▒██    ▒ ▓██░ ██▒
           ▒██▒ ▄██▒██  ▀█▄  ░ ▓██▄   ▒██▀▀██
           ▒██░█▀  ░██▄▄▄▄██   ▒   ██▒░▓█ ░██
           ░▓█  ▀█▓ ▓█   ▓██▒▒██████▒▒░▓█▒░██
           ░▒▓███▀▒ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒ ░░▒░
           ▒░▒   ░   ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░▒░ 
            ░    ░   ░   ▒   ░  ░  ░   ░  ░░ 
            ░            ░  ░      ░   ░  ░  
                 ░ 
${GREEN}---------------------------------------------------------------
`bash --version`

HOSTNAME:          $HOSTNAME
HOME:              $HOME
LOGGED IN AS:      $USER
UPTIME:            `uptime`
"