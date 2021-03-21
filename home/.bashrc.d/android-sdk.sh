#!/usr/bin/env bash

if [[ -d ${HOME}/android ]]; then
    export ANDROID_HOME=${HOME}/Android-Sdk
    path-add "$ANDROID_HOME/cmdline-tools/latest/bin"
    path-add "$ANDROID_HOME/platform-tools"
fi
