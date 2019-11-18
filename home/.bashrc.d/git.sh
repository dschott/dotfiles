#!/usr/bin/env bash

! command-exists git && return

alias g='git'
complete -F _complete_alias g
