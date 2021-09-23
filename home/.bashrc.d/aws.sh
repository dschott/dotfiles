#!/usr/bin/env bash

if check-command -q aws_completer; then
    complete -C "$(which aws_completer)" aws
fi
