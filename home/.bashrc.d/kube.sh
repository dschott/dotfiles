#!/usr/bin/env bash

! command-exists kubectl && return

alias kc='kubectl'
alias kcc='kubectl config current-context'

complete -o default -F __start_kubectl kc
