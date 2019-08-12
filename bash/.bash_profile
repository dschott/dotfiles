#!/usr/bin/env bash

[ -r $HOME/.profile ] && . $HOME/.profile

HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
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

complete -C /Users/gkrps/go/bin/gocomplete go
