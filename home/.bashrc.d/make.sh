#!/usr/bin/env bash

if check-command -q make; then
    alias m='make'
    complete -F _complete_alias m
fi
