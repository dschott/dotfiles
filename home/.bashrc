#!/usr/bin/env bash

# If .bashrc is a link, assume it exists in dotfiles dir
if [ ! -z "$(readlink ${HOME}/.bashrc)" ]; then
    export DOTPATH="$(cd "$(dirname "$(readlink ${HOME}/.bashrc)")/.."; pwd)"
else
    echo "Unable to locate dotfiles!"
    return
fi

# Export bin paths
if ! echo "${PATH}" | grep -q "${DOTPATH}/bin"; then
    export PATH="${DOTPATH}/bin:${PATH}"
fi

# Login shell functions
. ${HOME}/.bash_lib

# User settings
. ${HOME}/.bash_settings

# Source remaining bashrc files
for f in ${HOME}/.bashrc.d/*; do
    if [ -f ${f} ]; then
        . $f
    fi
done

path-add "/usr/local/sbin"

# Source local bashrc file (private keys etc)
[ -r "${HOME}/.bashrc.local" ] && . "$HOME/.bashrc.local"

# Color Escape Codes
COLOR_RED="\e[0;31m"
COLOR_CYAN="\e[0;36m"
COLOR_YELLOW="\e[0;33m"
COLOR_GREEN="\e[0;32m"
COLOR_NONE="\e[0m"

# Prompt
PS1="\[${COLOR_RED}\][\[${COLOR_CYAN}\]\u@\h\[${COLOR_RED}\]] \$(date +%H:%M) \w\[${COLOR_YELLOW}\] \$(git-branch | sed 's/\(.*\)/(\1)/')\n\[${COLOR_GREEN}\]\$ \[${COLOR_NONE}\]"
