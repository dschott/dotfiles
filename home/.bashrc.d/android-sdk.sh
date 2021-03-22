#!/usr/bin/env bash

if [[ -d ${HOME}/Android-Sdk ]]; then
    export ANDROID_HOME=${HOME}/Android-Sdk
    export ANDROID_SDK_ROOT=${HOME}/Android-Sdk
    export REPO_OS_OVERRIDE="linux"
    
    path-add "${ANDROID_HOME}/cmdline-tools/latest/bin"
    path-add "${ANDROID_HOME}/emulator"
    path-add "${ANDROID_HOME}/tools"
    path-add "${ANDROID_HOME}/tools/bin"
    path-add "${ANDROID_HOME}/platform-tools"

    # For WSL2
    # https://medium.com/@pellea/using-the-android-emulator-on-windows-10-with-wsl2-39c2bae30c49
    # https://medium.com/@pellea/using-adb-with-wsl2-7aebbb070a47
    # https://gist.github.com/bergmannjg/461958db03c6ae41a66d264ae6504ade#create-android-virtual-device-in-windows
    # https://stackoverflow.com/questions/62145379/how-to-connect-android-studio-running-inside-wsl2-with-connected-devices-or-andr

    export ADB_SERVER_SOCKET=tcp:$(grep nameserver /etc/resolv.conf | cut -d' ' -f2):5037
fi
