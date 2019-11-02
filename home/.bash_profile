#!/usr/bin/env bash

[ -r ${HOME}/.bashrc ] && . ${HOME}/.bashrc

# Login Shell Splash
printf "${COLOR_RED} _____   _____   _____   _____ 
||   || ||   || ||   || ||   ||
|| B || || A || || S || || H ||
||___|| ||___|| ||___|| ||___||
|/___\| |/___\| |/___\| |/___\|
 
${COLOR_RED}SHELL:     ${COLOR_CYAN}`echo ${BASH}, version ${BASH_VERSION}`
${COLOR_RED}HOSTNAME:  ${COLOR_CYAN}${HOSTNAME}
${COLOR_RED}HOME:      ${COLOR_CYAN}${HOME}
${COLOR_RED}USER:      ${COLOR_CYAN}${USER}
${COLOR_RED}UPTIME:    ${COLOR_CYAN}`echo -e \`uptime\``\n\n"
