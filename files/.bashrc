# Homebrew
if [ -n "$(command -v brew)" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# git
if [ -n "$(command -v git)" ]; then
    if [ -f $HOME/.git_completion.bash ]; then
        source $HOME/.git_completion.bash
    fi
fi

# Kubernetes
if [ -n "$(command -v kubectl)" ]; then
    if [ -f $HOME/.kube_completion.sh ]; then
        source $HOME/.kube_completion.sh
    fi
    if [ -f $HOME/.helm_completion.sh ]; then
        source $HOME/.helm_completion.sh
    fi
fi

# Shell
export CLICOLOR=1
export CLICOLOR=GxFxCxDxBxegedabagaced
shopt -s checkwinsize

# Prompt
parse_git_branch() {
    if [ -n "$(command -v git)" ]; then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    else
        echo ""
    fi
}
RED="\[\033[0;31m\]"
GRAY="\[\033[0;90m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
PS1="${RED}[${GRAY}\u@\h ${RED}] ${RED}\$(date +%H:%M) \w${YELLOW} \$(parse_git_branch)${GREEN}\n\$ "


RED="\033[0;31m"
GREEN="\033[0;32m"
printf "${GREEN}---------------------------------------------------------------
${RED}
            ▄▄▄▄    ▄▄▄        ██████  ██░ ██ 
           ▓█████▄ ▒████▄    ▒██    ▒ ▓██░ ██▒
           ▒██▒ ▄██▒██  ▀█▄  ░ ▓██▄   ▒██▀▀██
           ▒██░█▀  ░██▄▄▄▄██   ▒   ██▒░▓█ ░██
           ░▓█  ▀█▓ ▓█   ▓██▒▒██████▒▒░▓█▒░██
           ░▒▓███▀▒ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒ ░░▒░
           ▒░▒   ░   ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░▒░ 
            ░    ░   ░   ▒   ░  ░  ░   ░  ░░ 
            ░            ░  ░      ░   ░  ░  
                 ░ 
${GREEN}---------------------------------------------------------------
`bash --version`

HOSTNAME:          $HOSTNAME
HOME:              $HOME
LOGGED IN AS:      $USER
UPTIME:            `uptime`
"