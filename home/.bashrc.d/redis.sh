#!/usr/bin/env bash

if [ -d '/Applications/Redis.app/Contents/Resources/Vendor/redis/bin' ]; then
    export PATH="/Applications/Redis.app/Contents/Resources/Vendor/redis/bin:${PATH}"
fi
