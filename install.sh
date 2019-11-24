#!/usr/bin/env bash

export DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"

$DOTPATH/bin/dotfiles-link

. "$HOME/.bashrc"

homebrew-install

brewfile-install

apt-install

snap-install

pip-install

git-config

docker-install

bin-install

gocomplete-install

vscode-install-all

terminal-set-theme

macos-install-keybindings

notes-install

sh-configure

echo "Install complete!"

. "$HOME/.bash_profile"
