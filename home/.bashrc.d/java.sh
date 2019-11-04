#!/usr/bin/env bash

java-version() {
    if command-exists javac; then
        current_version="$(javac -version 2>&1 | sed -n 's/javac \(.*\)/\1/p')"
    else
        current_version="-"
    fi

    if os-is-darwin; then
        versions=$(/usr/libexec/java_home -V 2>&1 | sed -n 's/.*"\(.*\)".*/\1/p')
    elif os-is-linux; then
        versions=$(update-java-alternatives -l)
    fi

    if [ -z "${1}" ]; then
        echo "current version:"
        echo "    ${current_version}"
        echo
        echo "available versions:"
        echo "${versions}" | sed 's/^/    /'
        return
    fi

    if os-is-darwin; then
        export JAVA_HOME="$(/usr/libexec/java_home -v ${1})"
    elif os-is-linux; then
        sudo update-java-alternatives -s "${1}"
    fi
}

if os-is-darwin; then
    java-version 12
fi
