#!/usr/bin/env bash

! command-exists sbt && return

export PATH="/usr/local/opt/sbt@0.13/bin:${PATH}"
