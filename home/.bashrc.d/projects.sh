#!/usr/bin/env bash

eval "$(projects completion bash)"

alias c='projects code'
complete -F _complete_alias c

alias p='projects'
complete -F _complete_alias p
