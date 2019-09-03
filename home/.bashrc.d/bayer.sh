#!/usr/bin/env bash

[ "$(hostname)" != "C02XP0MFJGH5" ] && return

export USER_FULLNAME="Doug Schott"
export USER_EMAIL="douglas.schott@monsanto.com"
export VAULT_ADDR=https://vault.agro.services

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

bayernet-open() {
    vpn-disconnect
    proxy-on
    proxy-seturl "http://pac.hybrid-web.global.blackspider.com/proxy.pac?p=4m92bzff"
    vpn-connect "Standard VPN - IRV"
    open "https://new.bayernet.cnb/en"
}
