#!/usr/bin/env bash

! command-exists vault && return

complete -C "$(command -v vault)" vault
