#!/usr/bin/env bash

if check-command -q kubectl; then
    alias k='kubectl'
    complete -F _complete_alias k

    alias kc='kubectl config'
    complete -F _complete_alias kc

    alias kcu='kubectl config use-context'
    complete -F _complete_alias kcu

    alias kcc='kubectl config current-context'
    complete -F _complete_alias kcc
fi
