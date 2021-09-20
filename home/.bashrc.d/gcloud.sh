#!/usr/bin/env bash

if check-command -q gcloud realpath; then
     export CLOUDSDK_PYTHON=$(realpath "$(which python3)")
     gcloud_path=$(dirname "$(realpath "$(which gcloud)")")

     if [[ -f ${gcloud_path}/../path.bash.inc ]]; then
          source "${gcloud_path}/../path.bash.inc"
     fi
        if [[ -f ${gcloud_path}/../completion.bash.inc ]]; then
          source "${gcloud_path}/../completion.bash.inc"
     fi
     
     unset gcloud_path
fi
