#!/usr/bin/env bash
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"

echo "Pulling down tmux repo"
if [ -d $scriptpath/tmux ]; then
    (cd $scriptpath/tmux && git pull)
else
    git clone git@github.com:dschott/.tmux.git $scriptpath/tmux
fi

echo "Linking dot files"
for f in $(find "$scriptpath" -maxdepth 2 -mindepth 2 -type f -name '.*'); do
    ln -svf $f $HOME
done

. "$HOME/.profile"

echo "Setting local env vars"
env-setlocal USER_FULLNAME
env-setlocal USER_EMAIL
env-setlocal HOMEBREW_GITHUB_API_TOKEN

if [ -z "$(command -v brew)" ]; then
    echo "Installing Homebrew"
    /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
    echo "Homebrew already installed"
fi

echo "Installing brew bundle"
brewfile-install

. "$HOME/.profile"

echo "Install Complete!"
