#!/usr/bin/env bash

! command-exists brew && return

HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    # shellcheck disable=SC1090
    . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      # shellcheck disable=SC1090
      [[ -r "${COMPLETION}" ]] && . "${COMPLETION}"
    done
  fi
fi
