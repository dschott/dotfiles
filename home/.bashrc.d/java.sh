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
    fi
}

java-version 12


# if os-is-darwin; then
#     # Ref: http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
#     if [ -z "$1" ]; then
#         printf "Current Version:\n    ${current_version}\n\nAvailable Versions:\n$(/usr/libexec/java_home -V 2>&1 | grep Library)\n"
#     elif . sh-is-subshell; then
#         echo "$0 must be sourced"
#     else
#         . path-remove '/System/Library/Frameworks/JavaVM.framework/Home/bin'

#         if [ -n "${JAVA_HOME+x}" ]; then
#             . path-remove ${JAVA_HOME}
#         fi

#         export JAVA_HOME=`/usr/libexec/java_home -v $@`
# # alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"

#         . path-add "${JAVA_HOME}/bin"
#     fi
# elif os-is-debian; then
#     if [ -z "$1" ]; then
#         echo "current version:"
#         echo "    ${current_version}"
#         echo
#         echo "available versions:"
#         update-java-alternatives -l | sed 's/^/    /'
#     else
#         sudo update-java-alternatives -s "${1}"
#     fi
# fi
