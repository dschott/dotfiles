#!/usr/bin/env bash

if check-command -q brew; then
  HOMEBREW_PREFIX=$(brew --prefix)
  if type brew &>/dev/null; then
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
      . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
      for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
        [[ -r "${COMPLETION}" ]] && . "${COMPLETION}"
      done
    fi
  fi
fi
