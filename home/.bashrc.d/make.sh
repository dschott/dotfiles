#!/usr/bin/env bash

if check-command -q make; then
    alias m='gmake'
    alias make='gmake'
    complete -F _complete_alias m
fi
