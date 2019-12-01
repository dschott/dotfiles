#!/usr/bin/env bash

if check-command -q vault; then
    complete -C "$(command -v vault)" vault
fi
