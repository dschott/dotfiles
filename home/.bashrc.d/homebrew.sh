#!/usr/bin/env bash

brew_binary=/usr/local/bin/brew
if [[ ! -f ${brew_binary} ]]; then
  brew_binary=/opt/homebrew/bin/brew
  if [[ ! -f ${brew_binary} ]]; then
    brew_binary=/home/linuxbrew/.linuxbrew/bin/brew
    if [[ ! -f ${brew_binary} ]]; then
      exit
    fi
  fi
fi

eval "$("${brew_binary}" shellenv)"

if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
  . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
else
  for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
    [[ -r "${COMPLETION}" ]] && . "${COMPLETION}"
  done
fi

if [[ -r "${HOMEBREW_PREFIX}/etc/bash_completion.d/git-completion.bash" ]]; then
  . "${HOMEBREW_PREFIX}/etc/bash_completion.d/git-completion.bash"
fi
