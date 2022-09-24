#!/usr/bin/env zsh

DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"
export DOTPATH

"${DOTPATH}"/bin/dotfiles-link

. "${HOME}/.zshrc"

fonts-install
oh-my-zsh-install
brewfile-install
keybindings-install
go-pkg-install
pip-pkg-install
npm-pkg-install
term-theme-install

echo "Install complete!"

. "${HOME}/.zshrc"
