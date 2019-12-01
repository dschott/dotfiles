#!/usr/bin/env bash

if check-command -q sbt; then
    path-add "/usr/local/opt/sbt@0.13/bin"
fi
