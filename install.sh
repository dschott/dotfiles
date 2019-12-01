#!/usr/bin/env bash

DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"
export DOTPATH

"${DOTPATH}"/bin/dotfiles-link

. "${HOME}/.bashrc"

git-config

git sub

case "$(uname -s)" in
Linux)
    apt-install
    snap-install
    ;;
Darwin)
    homebrew-install
    brewfile-install
    keybindings-install
    terminal-set-theme
    ;;
esac

pip-install

bin-install

npm-install

docker-install

# hmmm...
if ! check-command -q go; then
    go-version "$(go-version | tail -1 | tr -d ' ')"
fi

gocomplete-install

vscode-install-all

sh-configure

echo "Install complete!"

. "$HOME/.bash_profile"
