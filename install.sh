#!/usr/bin/env bash
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"
cd $scriptpath

# Link dotfiles
echo "Linking dot files"
for f in $(find "$(pwd)" -maxdepth 2 -mindepth 2 -type f -name '.*'); do
    if [ "$(basename $f)" != ".git" ]; then
        ln -svf $f $HOME
    fi
done

# Source dotfiles (pre-install)
# - Even if installs are missing, nothing should fail
. "$HOME/.profile"

# Setup machine local env vars
echo "Setting local env vars"
env-setlocal USER_FULLNAME
env-setlocal USER_EMAIL
env-setlocal HOMEBREW_GITHUB_API_TOKEN

# Homebrew
echo "Installing Homebrew"
homebrew-install

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

# Install other stuff
echo "Installing docker completion"
docker-install-completion

echo "Installing go completion"
go-install-completion

 # Install vscode extensions
echo "Installing vscode extensions"
vscode-ext-install

# Source dotfiles (post-install)
. "$HOME/.profile"

# My favorite theme
[ "$(uname -s)" == "Darwin" ] && open "$(pwd)/terminal/macos/themes/schemes/Afterglow.terminal"

echo "Install Complete!"
