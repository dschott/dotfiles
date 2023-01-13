#!/usr/bin/env zsh

dothome=$(cd "$(dirname "$0")" && pwd -P)/home

find "${dothome}" -maxdepth 1 -mindepth 1 -name '.*' -exec ln -svf {} "${HOME}" \;

ln -svf "${dothome}/.ssh/config" "${HOME}/.ssh/config"

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
