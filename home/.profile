#!/usr/bin/env sh

# If .profile is a link, assume it exists in dotfiles dir
if [ ! -z "$(readlink $HOME/.profile)" ]; then
    export DOTPATH="$(cd "$(dirname "$(readlink $HOME/.profile)")/.."; pwd)"
else
    echo "Unable to locate dotfiles!"
    return
fi

export PATH="$DOTPATH/bin:$PATH"

# Local profile (private keys etc)
[ -r "$HOME/.profile.local" ] && source "$HOME/.profile.local"

# Source all sub files
for f in $DOTPATH/shell/*; do
    source $f
done

path-add "/usr/local/sbin"
