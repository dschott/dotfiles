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

echo ""
echo "Brew bundle install"
brewfile-install

echo ""
echo "Done! Open a new terminal. Be happy."