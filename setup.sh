#!/usr/bin/env bash
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"

if [ -z "$(command -v brew)" ]; then
    echo ""
    echo "Installing Brew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
    echo ""
    echo "Brew already installed."
fi

echo ""
echo "Linking dot files"
for dot_file in `find $scriptpath/files -type f -name ".*"`; do
    ln -svf $dot_file $HOME
done

# Local profile (private keys etc)
if [ ! -f "$HOME/.profile.local" ]; then
    read -p 'Enter your HOMEBREW GITHUB API TOKEN: ' token
    echo "export HOMEBREW_GITHUB_API_TOKEN=$token"  > "$HOME/.profile.local"
fi

source "$HOME/.profile.local"
echo ""

if [ ! -z "$HOMEBREW_GITHUB_API_TOKEN" ]; then     
    echo "Brew bundle install"
    brew update
    brew bundle install -v --file "$scriptpath/brewfile"
else
    echo "HOMEBREW_GITHUB_API_TOKEN not set!"
    echo "You can set your token later in ~/.profile.local"
    echo "Brew bundle install skipped"
fi

source "$HOME/.profile"

echo ""
echo "Done!"