#!/usr/bin/env bash

export DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"

$DOTPATH/bin/dotfiles-link

. "$HOME/.bashrc"

homebrew-install

brewfile-install

git-config

docker-completion-install

gocomplete-install

#vscode-install-extensions

vscode-install-settings

vscode-install-keybindings

terminal-set-theme

macos-install-keybindings

notes-install

sh-configure

echo "Install complete!"

. "$HOME/.bash_profile"
