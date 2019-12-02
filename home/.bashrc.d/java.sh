#!/usr/bin/env bash

if check-command -q java; then
    java-version() {
        if check-command -q javac; then
            current_version="$(javac -version 2>&1 | sed -n 's/javac \(.*\)/\1/p')"
        else
            current_version="-"
        fi

        case "$(uname -s)" in
        Darwin)
            versions=$(/usr/libexec/java_home -V 2>&1 | sed -n 's/.*"\(.*\)".*/\1/p')
            ;;
        Linux)
            versions=$(update-java-alternatives -l)
            ;;
        esac

        if [ -z "${1}" ]; then
            echo "current version:"
            echo "    ${current_version}"
            echo
            echo "available versions:"
            # shellcheck disable=SC2001
            echo "${versions}" | sed 's/^/    /'
            return
        fi

        case "$(uname -s)" in
        Darwin)
            JAVA_HOME=$(/usr/libexec/java_home -v "${1}")
            export JAVA_HOME
            ;;
        Linux)
            sudo update-java-alternatives -s "${1}"
            ;;
        esac
    }

    case "$(uname -s)" in
    Darwin)
        java-version 12
        ;;
    esac
fi
