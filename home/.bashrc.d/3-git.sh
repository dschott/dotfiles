#!/usr/bin/env bash

if check-command -q git; then
    alias g='git'
    complete -F _complete_alias g
    export DELTA_PAGER="less -+FX -R --tabs 4 -c"
fi
