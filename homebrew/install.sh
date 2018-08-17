#!/usr/bin/env sh

if [ -z "$(command -v brew)" ]; then
    echo "Installing Homebrew"
    /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
    echo "Homebrew already installed"
fi

echo "Checking HOMEBREW_GITHUB_API_TOKEN env var"
env-setlocal HOMEBREW_GITHUB_API_TOKEN

echo "Installing brew bundle"
brewfile-install
