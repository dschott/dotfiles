#!/usr/bin/env bash

if [[ $USER == gkrps ]]; then

    vault-login-bayer() {
        vault login -method=oidc
    }

    proxy-on-bayer() {
        proxy-seturl "http://asb-proxy.bayerbbs.net/mcp.pac"
        proxy-on
    }

    export AWS_PROFILE=saml
    alias aws-sso='/Users/gkrps/Library/Python/3.9/bin/aws-sso -u douglas.schott.ext@bayer.com'

    vpn-proxy-pass() {
        echo 'Please enter your Bayer password.  It will be encrypted in your keychain. '
        security add-generic-password -a "$USER" -s 'Terminal Env Proxy password' -U -w
        vpn-proxy
    }

    vpn-proxy() {
        proxy_ip_port="10.11.24.70:8080"

        if ! security find-generic-password -s 'Terminal Env Proxy password' >/dev/null 2>&1 ; then
            echo "Proxy password not set.  Run 'vpn-proxy-pass' to set it." ;
        else
            # Macs appear to often have 1-2 other utun interfaces with IPv6 addresses.  We want the one with a 10.X ipv4 addr. If it exists, assume on VPN.
            if ! ifconfig | awk '/^utun[0-9]/ { getline; sub("addr:", ""); if (index($2, "10.") == 1) exit 1 }' ; then
                echo "Detected you are on VPN.  Setting proxy variables."
                if [[ $(http_proxy="http://$proxy_ip_port" curl -s -o /dev/null http://cnn.com -w "%{http_code}") == "407" ]] ; then
                    auth_resp=$(curl -s -o /dev/null http://cnn.com --proxy-user $USER:$(python -c "import urllib; print urllib.quote('''$(security find-generic-password -s 'Terminal Env Proxy password' -w)''')")  --proxy http://$proxy_ip_port -w "%{http_code}")
                    if [[ "$auth_resp" == "407" ]] ; then
                        echo "Proxy authentication failed.  Perhaps you need to run 'vpn-proxy-pass' to update your password?"
                        unset https_proxy http_proxy
                        return
                    fi
                fi
                export https_proxy="http://$proxy_ip_port";
                export http_proxy=$https_proxy;

            else
                echo "Detected you are off VPN. Clearing proxy variables."
                unset https_proxy http_proxy
            fi
        fi
    }
fi
