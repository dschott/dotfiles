#!/usr/bin/env bash

DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"
export DOTPATH

"${DOTPATH}"/bin/dotfiles-link

# shellcheck disable=SC1090
. "$HOME/.bashrc"

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

git-sub

echo "Install complete!"

# shellcheck disable=SC1090
. "$HOME/.bash_profile"
