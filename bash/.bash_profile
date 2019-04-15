#!/usr/bin/env bash

[ -r $HOME/.profile ] && . $HOME/.profile

if type brew &>/dev/null; then
  for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
  if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]];
  then
    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
  fi
fi

complete -C /usr/local/bin/vault vault

# Shell Config
export CLICOLOR=1
shopt -s checkwinsize

# Prompt
RED="\e[0;31m"
CYAN="\e[0;36m"
YELLOW="\e[0;33m"
GREEN="\e[0;32m"
RESET="\e[0m"
PS1="\[${RED}\][\[${CYAN}\]\u@\h\[${RED}\]] \$(date +%H:%M) \w\[${YELLOW}\] \$(git-whichbranch)\[${GREEN}\]\n\$ \[${RESET}\]"


# Splash
printf "${RED}
 _____   _____   _____   _____ 
||   || ||   || ||   || ||   ||
|| B || || A || || S || || H ||
||___|| ||___|| ||___|| ||___||
|/___\| |/___\| |/___\| |/___\|
 
${RED}SHELL:     ${CYAN}`echo $BASH, version $BASH_VERSION`
${RED}HOSTNAME:  ${CYAN}$HOSTNAME
${RED}HOME:      ${CYAN}$HOME
${RED}USER:      ${CYAN}$USER
${RED}UPTIME:    ${CYAN}`uptime`\n\n"
