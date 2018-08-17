#!/usr/bin/env sh

# If .profile is a link, assume it exists in dotfiles dir
if [ ! -z "$(readlink $HOME/.profile)" ]; then
    export DOTPATH="$(cd "$(dirname "$(readlink $HOME/.profile)")/.."; pwd)"
else
    echo "Unable to locate dotfiles!"
    return
fi

path-add() {
    export PATH="$1:$PATH"
}

path-remove() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

env-setlocal() {
    var=$1
    val=$(eval 'echo $'$var)
    if [ -z "$val" ]; then     
        echo "$var not set!"
        read -p "Enter a value for $var: " val
        if [ ! -z "$val" ]; then
            printf "\nexport $var=$val\n" >> "$HOME/.profile.local"
            source "$HOME/.profile.local"
        fi
    fi
}

# Local profile (private keys etc)
[ -r "$HOME/.profile.local" ] && . "$HOME/.profile.local"

# Source all sub files
for f in $DOTPATH/sh/source/*; do
    . $f
done
