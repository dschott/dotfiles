#!/usr/bin/env bash

eval "$(projects completion bash)"

alias p='projects'
complete -F _complete_alias p

alias e='projects edit'
complete -F _complete_alias e

alias o='projects open'
complete -F _complete_alias o
