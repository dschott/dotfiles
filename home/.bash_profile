#!/usr/bin/env bash

[ -r $HOME/.profile ] && source $HOME/.profile

# Shell Config
export CLICOLOR=1
shopt -s checkwinsize

# Prompt
COLOR_RED="\e[0;31m"
COLOR_CYAN="\e[0;36m"
COLOR_YELLOW="\e[0;33m"
COLOR_GREEN="\e[0;32m"
COLOR_NONE="\e[0m"
PS1="\[${COLOR_RED}\][\[${COLOR_CYAN}\]\u@\h\[${COLOR_RED}\]] \$(date +%H:%M) \w\[${COLOR_YELLOW}\] \$(git-whichbranch)\[${COLOR_GREEN}\]\n\$ \[${COLOR_NONE}\]"


# Splash
printf "${COLOR_RED}
 _____   _____   _____   _____ 
||   || ||   || ||   || ||   ||
|| B || || A || || S || || H ||
||___|| ||___|| ||___|| ||___||
|/___\| |/___\| |/___\| |/___\|
 
${COLOR_RED}SHELL:     ${COLOR_CYAN}`echo $BASH, version $BASH_VERSION`
${COLOR_RED}HOSTNAME:  ${COLOR_CYAN}$HOSTNAME
${COLOR_RED}HOME:      ${COLOR_CYAN}$HOME
${COLOR_RED}USER:      ${COLOR_CYAN}$USER
${COLOR_RED}UPTIME:    ${COLOR_CYAN}`uptime`\n\n"

complete -C /Users/gkrps/go/bin/gocomplete go
