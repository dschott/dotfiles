#!/usr/bin/env bash

# If .bash_profile is a link, assume it exists in dotfiles dir
if [ ! -z "$(readlink $HOME/.bash_profile)" ]; then
    export DOTPATH="$(cd "$(dirname "$(readlink $HOME/.bash_profile)")/.."; pwd)"
else
    echo "Unable to locate dotfiles!"
    return
fi

# Add all bin commands to path
export PATH="$DOTPATH/bin:$PATH"

# Local bashrc (private keys etc)
[ -r "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

# Source all shell files
for f in $HOME/.bashrc.d/*; do
    source $f
done

path-add "/usr/local/sbin"

# Shell Config
export CLICOLOR=1
shopt -s checkwinsize

# Color Escape Codes
COLOR_RED="\e[0;31m"
COLOR_CYAN="\e[0;36m"
COLOR_YELLOW="\e[0;33m"
COLOR_GREEN="\e[0;32m"
COLOR_NONE="\e[0m"

# Prompt
PS1="\[${COLOR_RED}\][\[${COLOR_CYAN}\]\u@\h\[${COLOR_RED}\]] \$(date +%H:%M) \w\[${COLOR_YELLOW}\] \$(git-whichbranch)\[${COLOR_GREEN}\]\n\$ \[${COLOR_NONE}\]"
