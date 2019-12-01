#!/usr/bin/env bash

# If .bashrc is a link, assume it exists in dotfiles dir
if [ -n "$(readlink "${HOME}/.bashrc")" ]; then
    # shellcheck disable=SC2164
    DOTPATH="$(cd "$(dirname "$(readlink "${HOME}/.bashrc")")/.."; pwd)"
    export DOTPATH
else
    echo "Unable to locate dotfiles!"
    return
fi

# Export bin paths
if ! echo "${PATH}" | grep -q "${DOTPATH}/bin"; then
    export PATH="${DOTPATH}/bin:${PATH}"
fi

# Login shell functions
. "${HOME}/.bash_lib"

# User settings
. "${HOME}/.bash_settings"

# Source remaining bashrc files
for f in "${HOME}"/.bashrc.d/*; do
    if [ -f "${f}" ]; then
        . "${f}"
    fi
done

path-add "/usr/local/sbin"

# Source local bashrc file (private keys etc)
[ -r "${HOME}/.bashrc.local" ] && . "$HOME/.bashrc.local"

# Splash & Prompt
red="\e[0;31m"
cyan="\e[0;36m"
yellow="\e[0;33m"
green="\e[0;32m"
normal="\e[0m"

PS1="\[${red}\][\[${cyan}\]\u@\h\[${red}\]] \$(date +%H:%M) \w\[${yellow}\] \$(git bn | sed 's/\(.*\)/(\1)/')\n\[${green}\]\$ \[${normal}\]"

if [ "${SHLVL}" = "1" ]; then
    printf "%b
 _____   _____   _____   _____ 
||   || ||   || ||   || ||   ||
|| B || || A || || S || || H ||
||___|| ||___|| ||___|| ||___||
|/___\| |/___\| |/___\| |/___\|

%bSHELL:     %b${BASH}, version ${BASH_VERSION}
%bHOSTNAME:  %b${HOSTNAME}
%bHOME:      %b${HOME}
%bUSER:      %b${USER}
%bUPTIME:   %b$(uptime)%b\n\n" "${red}" "${red}" "${cyan}" "${red}" "${cyan}" "${red}" "${cyan}" "${red}" "${cyan}" "${red}" "${cyan}" "${normal}"

else
    PS1="\[${red}\]*${PS1}"
fi

unset red cyan yellow green normal
