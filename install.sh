#!/usr/bin/env bash
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"

# Link dotfiles
echo "Linking dot files"
for f in $(find "$scriptpath" -maxdepth 2 -mindepth 2 -type f -name '.*'); do
    if [ "$(basename $f)" != ".git" ]; then
        ln -svf $f $HOME
    fi
done

. "$HOME/.profile"

# Setup machine local env vars
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

# Default shell
bash_path='/usr/local/bin/bash'
file='/etc/shells'
if [ -z $(grep "$bash_path" "$file") ]; then
    echo "Configure default shell"
    sudo sh -c "grep -q -F '$bash_path' $file || echo '$bash_path' >> $file"
    chsh -s "$bash_path" $USER
else
    echo "Default shell already configured"
fi

 # vscode
echo "Installing vscode extensions"
vscode-ext-install

. "$HOME/.profile"

[ "$(uname -s)" == "Darwin" ] && open "$scriptpath/terminal/macos/themes/schemes/Afterglow.terminal"

echo "Install Complete!"
