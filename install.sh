#!/usr/bin/env bash
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"

echo "Linking dot files"
for f in $(find "$scriptpath" -maxdepth 2 -mindepth 2 -type f -name '.*'); do
    ln -svf $f $HOME
done

. "$HOME/.profile"

echo "Setting local env vars"
env-setlocal USER_FULLNAME
env-setlocal USER_EMAIL
env-setlocal HOMEBREW_GITHUB_API_TOKEN

# Homebrew
if [ "$(uname -s)" == "Darwin" ]; then
    if [ -z "$(command -v brew)" ]; then
        echo "Installing Homebrew"
        /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else 
        echo "Homebrew already installed"
    fi
fi

echo "Installing brew bundle"
brewfile-install

echo "Switch default shell to bash install via brew"
bash_path='/usr/local/bin/bash'
file='/etc/shells'
sudo sh -c "grep -q -F '$bash_path' $file || echo '$bash_path' >> $file"
chsh -s "$bash_path" $USER

echo "Installing vscode extensions"
vscode-ext-install

. "$HOME/.profile"

echo "Install Complete!"
