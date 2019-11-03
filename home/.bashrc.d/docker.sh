#!/usr/bin/env bash

if command-exists docker; then
    alias d='docker'
    complete -F _docker d
fi

if command-exists docker-compose; then
    alias dc='docker-compose'
    complete -F _docker_compose dc
fi
