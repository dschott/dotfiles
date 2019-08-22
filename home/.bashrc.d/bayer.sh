#!/usr/bin/env bash

[ "$(hostname)" != "C02XP0MFJGH5" ] && return

export USER_FULLNAME='Doug Schott'
export USER_EMAIL='douglas.schott@monsanto.com'
export VAULT_ADDR=https://vault.agro.services

vault-login() {
    vault login -method=userpass -path=ping username=GKRPS
}

proxy-off() {
    networksetup -setautoproxystate Wi-Fi off
}

proxy-state() {
    networksetup -getautoproxyurl Wi-Fi
}

proxy-on() {
    networksetup -setautoproxystate Wi-Fi on
}

proxy-off
