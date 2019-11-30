#!/usr/bin/env bash

! command-exists projects && return

source projects complete

alias c='projects code'
complete -F _complete_alias c
