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

echo "Checking USER_NAME env var"
env-setlocal USER_FULLNAME

echo "Checking USER_EMAIL env var"
env-setlocal USER_EMAIL

if [ -z "$(command -v brew)" ]; then
    echo "Installing Homebrew"
    /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
    echo "Homebrew already installed"
fi

echo "Checking HOMEBREW_GITHUB_API_TOKEN env var"
env-setlocal HOMEBREW_GITHUB_API_TOKEN

echo "Installing brew bundle"
brewfile-install

. "$HOME/.profile"

echo "Install Complete!"
