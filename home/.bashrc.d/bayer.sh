#!/usr/bin/env bash

vault-login-bayer() {
    vault login -method=userpass -path=ping username=GKRPS
}

vpn-connect-bayer() {
    vpn-connect "Standard VPN - IRV"
    proxy-off
}

vpn-disconnect-bayer() {
    vpn-disconnect
    proxy-off
}

proxy-on-bayer() {
    proxy-on
    proxy-seturl "http://pac.hybrid-web.global.blackspider.com/proxy.pac?p=4m92bzff"
}

bayernet-open() {
    vpn-disconnect
    proxy-on-bayer
    vpn-connect "Standard VPN - IRV"
    open "https://new.bayernet.cnb/en"
}

ping-clients() {
    environment="${1}"; shift

    case "${environment}" in
    "nonprod")
        vault_path="secret/graphroots/cgs/nonprod/ping"
        ;;
    "prod")
        vault_path="secret/graphroots/cgs/prod/ping"
        ;;
    *)
        echo >&2 "expected environment: nonprod | prod"
        return 1
        ;;
    esac

    vault list "${vault_path}" | tail -n+3
}

ping-token() {
    ping_url=
    vault_path=
    environment="${1}"; shift
    client_id="${1}"; shift

    case "${environment}" in
    "nonprod")
        ping_url="https://test.amp.monsanto.com/as/token.oauth2"
        vault_path="secret/graphroots/cgs/nonprod/ping"
        ;;
    "prod")
        ping_url="https://amp.monsanto.com/as/token.oauth2"
        vault_path="secret/graphroots/cgs/prod/ping"
        ;;
    *)
        echo >&2 "expected environment: nonprod | prod"
        return 1
        ;;
    esac

    case "${client_id}" in
    "")
        echo "expected ping client_id" >&2
        return 1
        ;;
    "product360")
        client_id="graphroots"
        if [ "${environment}" == "prod" ]; then
            client_id="DATA-PRODUCT360-SVC"
        fi
        ;;
    esac

    token=$(curl -L -s -X POST "${ping_url}" \
        -H 'Content-Type: application/x-www-form-urlencoded' \
        --data-urlencode "client_id=${client_id}" \
        --data-urlencode "client_secret=$(vault read -field client_secret "${vault_path}/${client_id}")" \
        --data-urlencode "grant_type=client_credentials" | jq -r '.access_token')
    
    if [ "${token}" == "null" ]; then
        echo "failed to generate a token" >&2
        return 1
    else
        mkdir -p "${HOME}/.ping"
        echo "${token}" > "${HOME}/.ping/${environment}_${client_id}"
        echo "token successfully generated"
    fi
}

ping-bearer() {
    environment="${1}"; shift
    client_id="${1}"; shift
    
    if [ -z "${environment}" ]; then
        echo >&2 "expected environment: nonprod | prod"
        return 1
    fi

    if [ -z "${client_id}" ]; then
        echo >&2 "expected ping client_id"
        return 1
    fi

    case "${client_id}" in
    "")
        echo "expected ping client_id" >&2
        return 1
        ;;
    "product360")
        client_id="graphroots"
        if [ "${environment}" == "prod" ]; then
            client_id="DATA-PRODUCT360-SVC"
        fi
        ;;
    esac

    if [ ! -f "${HOME}/.ping/${environment}_${client_id}" ]; then
        echo >&2 "token not found"
        return 1
    fi

    echo "Authorization: bearer $(cat "${HOME}/.ping/${environment}_${client_id}")"
}
