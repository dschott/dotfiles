#!/usr/bin/env bash

if check-command -q git; then
    alias g='git'
    complete -F _complete_alias g
fi
