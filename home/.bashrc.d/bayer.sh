#!/usr/bin/env bash

if [[ $USER == gkrps ]]; then

    vault-login-bayer() {
        vault login -method=oidc
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

    export AWS_PROFILE=saml
    alias aws-sso='/Users/gkrps/Library/Python/3.9/bin/aws-sso -u douglas.schott.ext@bayer.com'

fi
