#!/usr/bin/env bash

if check-command -q docker; then
    alias d='docker'
    complete -F _docker d
fi

if check-command -q docker-compose; then
    alias dc='docker-compose'
    complete -F _docker_compose dc
fi
