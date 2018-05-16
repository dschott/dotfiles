# dotfiles
if [ -d $HOME/dotfiles ]; then
    DF=$HOME/dotfiles
fi

# Homebrew
if [ -n "$(command -v brew)" ]; then
    export HOMEBREW_GITHUB_API_TOKEN=d02d318f99862ff51eb7a293b16524d1aaf3eac2
fi

# git
if [ -n "$(command -v git)" ]; then
    alias git-log='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
    alias git-done="git commit -am '$1' && git push"
fi

# Kubernetes
if [ -n "$(command -v kubectl)" ]; then
    alias kc="kubectl"
    alias kcc="kubectl config current-context"
fi

# Golang
if [ -n "$(command -v go)" ]; then
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
    export GO=$HOME/go/src/github.com/
fi

# Scala
if [ -f '/usr/local/opt/sbt@0.13/bin' ]; then
    export PATH="/usr/local/opt/sbt@0.13/bin:$PATH"
fi

if [ "$BASH" ] && [ -e $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

exec "$@"
