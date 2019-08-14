#!/usr/bin/env bash
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"
cd $scriptpath

# Link dotfiles
echo "Linking dot files"
for f in $(find "$(pwd)/home" -maxdepth 1 -mindepth 1 -type f -name '.*'); do
    ln -svf $f $HOME
done

# TODO: Link .dirs

# Source dotfiles (pre-install)
source "$HOME/.profile"

# Setup machine local env vars
echo "Setting local env vars"
env-setlocal USER_FULLNAME
env-setlocal USER_EMAIL

# Installs
echo "Installing Homebrew"
homebrew-install

echo "Installing brew bundle"
brewfile-install

echo "Installing docker completion"
docker-completion-install

echo "Installing go completion"
go-completion-install

echo "Installing vscode extensions"
vscode-ext-install

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

# Source dotfiles (post-install)
source "$HOME/.profile"

# My favorite theme
[ "$(uname -s)" == "Darwin" ] && open "$(pwd)/etc/terminal/macos/themes/schemes/Afterglow.terminal"

echo "Install Complete!"
