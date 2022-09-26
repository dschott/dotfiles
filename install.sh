#!/usr/bin/env zsh

find "$(cd "$(dirname "$0")" && pwd -P)/home" -maxdepth 1 -mindepth 1 -name '.*' -exec ln -svf {} "${HOME}" \;

. "${HOME}/.zshrc"

fonts-install
oh-my-zsh-install
brewfile-install
keybindings-install
go-pkg-install
pip-pkg-install
npm-pkg-install
bin-install
term-theme-install

. "${HOME}/.zshrc"

echo "Install complete!"
