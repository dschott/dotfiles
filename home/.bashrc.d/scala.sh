#!/usr/bin/env bash

[ -z "$(command -v sbt)" ] && return

export PATH="/usr/local/opt/sbt@0.13/bin:${PATH}"
