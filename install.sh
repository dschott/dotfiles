#!/usr/bin/env bash
export DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"

# Link dotfiles
echo "Linking dot files"
$DOTPATH/bin/dotfiles-link

# Source dotfiles (pre-install)
source "$HOME/.bashrc"

# Setup machine local env vars
echo "Setting local user env vars"
env-setlocal USER_FULLNAME
env-setlocal USER_EMAIL

# Installs
echo "Installing homebrew"
homebrew-install

echo "Installing brew bundle"
brewfile-install

echo "Configuring git"
git-config

echo "Installing docker completion"
docker-completion-install

echo "Installing go completion"
gocomplete-install

echo "Installing vscode extensions"
vscode-install-extensions

echo "Installing vscode settings"
vscode-install-settings

echo "Installing vscode keybindings"
vscode-install-keybindings

# Set terminal theme
echo "Setting terminal theme"
terminal-set-theme

echo "Installing notes"
notes-install

# Configure shell
echo "Configuring shell"
sh-configure

# Source dotfiles (post-install)
source "$HOME/.bash_profile"

echo "Install complete!"
