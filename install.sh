#!/usr/bin/env bash
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"

echo "Linking dot files"
for f in $(find "$scriptpath" -maxdepth 2 -mindepth 2 -type f -name '.*'); do
    ln -svf $f $HOME
done

. "$HOME/.profile"

echo "Checking USER_EMAIL env var"
env-setlocal USER_EMAIL

. $DOTPATH/homebrew/install.sh

. "$HOME/.profile"

echo "Install Complete!"
