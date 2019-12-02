#!/usr/bin/env bash

eval "$(projects completion bash)"

alias e='projects edit'
complete -F _complete_alias e

alias p='projects'
complete -F _complete_alias p
