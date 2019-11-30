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
