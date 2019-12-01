#!/usr/bin/env bash

DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"
export DOTPATH

"${DOTPATH}"/bin/dotfiles-link

. "${HOME}/.bashrc"

homebrew-install

brewfile-install

apt-install

snap-install

pip-install

git-config

bin-install

npm-install

docker-install

gocomplete-install

vscode-install-all

terminal-set-theme

macos-install-keybindings

notes-install

sh-configure

g sub

echo "Install complete!"

. "$HOME/.bash_profile"
