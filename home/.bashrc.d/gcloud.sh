#!/usr/bin/env bash

if check-command -q gcloud; then
     source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
     source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
     export CLOUDSDK_PYTHON=/usr/local/opt/python@3.7/bin/python3
fi
