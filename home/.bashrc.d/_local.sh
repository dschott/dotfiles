#!/usr/bin/env sh

if [ "$(hostname)" = "C02XP0MFJGH5" ]; then
    export USER_FULLNAME="Doug Schott"
    export USER_EMAIL="douglas.schott.ext@bayer.com"
    export VAULT_ADDR=https://vault.agro.services
    export PATH="/usr/local/opt/protobuf@3.6/bin:$PATH"
    export PATH="/usr/local/opt/protoc-gen-go@1.0/bin:$PATH"
    
    code-genomics() {
        vscode-open "${GOPATH}/src/github.platforms.engineering/graphroots/genomics"
    }

    code-genomics-deploy() {
        vscode-open "${GOPATH}/src/github.platforms.engineering/graphroots/genomics-deploy"
    }

    code-genomics-deploy() {
        vscode-open "${HOME}/projects/genomics.wiki"
    }

    code-gokit() {
        codvscode-opene "${GOPATH}/src/github.platforms.engineering/graphroots/gokit"
    }

    code-golang-build() {
        vscode-open "${GOPATH}/src/github.platforms.engineering/graphroots/golang-build"
    }

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

else
    export USER_FULLNAME="Doug Schott"
    export USER_EMAIL="douglas.schott@gmail.com"
fi
