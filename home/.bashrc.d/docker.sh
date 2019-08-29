#!/usr/bin/env bash

if [ -n "$(command -v docker)" ]; then
    alias d='docker'
    complete -F _docker d
fi

if [ -n "$(command -v docker-compose)" ]; then
    alias dc='docker-compose'
    complete -F _docker_compose dc
fi
