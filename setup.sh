#!/usr/bin/env bash
set -e
scriptpath="$(cd "$(dirname "$0")" && pwd -P)"

echo "Linking bin files"
ln -svf $scriptpath/bin/* /usr/local/bin

echo ""
echo "Linking dot files"
for dot_file in `find $scriptpath/files -type f -name ".*"`; do
    ln -svf $dot_file /Users/doug
done

echo ""
echo "Brew install"
brew_file=$scriptpath/brewfile
echo $brew_file
brewfile-install $brew_file
