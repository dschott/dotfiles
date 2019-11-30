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
# shellcheck disable=SC1090
. "${HOME}/.bash_lib"

# User settings
# shellcheck disable=SC1090
. "${HOME}/.bash_settings"

# Source remaining bashrc files
for f in "${HOME}"/.bashrc.d/*; do
    if [ -f "${f}" ]; then
        # shellcheck disable=SC1090
        . "${f}"
    fi
done

path-add "/usr/local/sbin"

# Source local bashrc file (private keys etc)
# shellcheck disable=SC1090
[ -r "${HOME}/.bashrc.local" ] && . "$HOME/.bashrc.local"

# Color Escape Codes
COLOR_RED="\e[0;31m"
COLOR_CYAN="\e[0;36m"
COLOR_YELLOW="\e[0;33m"
COLOR_GREEN="\e[0;32m"
COLOR_NONE="\e[0m"

# Prompt
PS1="\[${COLOR_RED}\][\[${COLOR_CYAN}\]\u@\h\[${COLOR_RED}\]] \$(date +%H:%M) \w\[${COLOR_YELLOW}\] \$(git bn | sed 's/\(.*\)/(\1)/')\n\[${COLOR_GREEN}\]\$ \[${COLOR_NONE}\]"
