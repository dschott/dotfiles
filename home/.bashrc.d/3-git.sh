#!/usr/bin/env bash

if check-command -q git; then
    alias g='git'
    complete -F _complete_alias g
    export DELTA_PAGER="less -R --tabs 4"
    export DELTA_PAGER_PAGED="less -+FX -R --tabs 4 -c"
fi
