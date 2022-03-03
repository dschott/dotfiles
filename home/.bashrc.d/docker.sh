#!/usr/bin/env bash

if check-command -q docker; then
    alias d='docker'
    alias dc='docker compose'
fi
