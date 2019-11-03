#!/usr/bin/env bash

! command-exists vault && return

complete -C /usr/local/bin/vault vault
