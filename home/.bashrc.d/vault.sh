#!/usr/bin/env bash

[ -z "$(command -v vault)" ] && return

complete -C /usr/local/bin/vault vault
