# dotfiles
if [ -d $HOME/dotfiles ]; then
    export DOTPATH="$(cd "$(dirname "$(readlink $HOME/.profile)")/.."; pwd)"
fi

removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

# Homebrew
brewfile-dump() {
    brew bundle dump --force --file "$DOTPATH/brewfile"
}

brewfile-install() {
    brew update
    brew bundle install -v --file "$DOTPATH/brewfile"
}

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
    export GOBIN=$GOPATH/bin
    export GO=$HOME/go/src/github.com/
    export PATH=$GOBIN:$PATH
fi

# Scala
if [ -f '/usr/local/opt/sbt@0.13/bin' ]; then
    export PATH="/usr/local/opt/sbt@0.13/bin:$PATH"
fi

# Java
function jdk-setversion() {
    # Ref: http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
    if [ -z "$1" ]; then
echo "
Current Version:
$(javac -version 2>&1)

Available Versions:
$(/usr/libexec/java_home -V 2>&1 | grep Library)"
        return
    fi
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
        removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
}

# Lastpass
if [ -n "$(command -v lpass)" ]; then
    p() {
        c=${1} && shift
        case $c in
            p) lpass show -p "$@" ;;
            f) lpass ls | grep -i "$@" ;;
            *) lpass $c $@ ;;
        esac
    }
fi

# Local profile (private keys etc)
if [ -f "$HOME/.profile.local" ]; then
    source "$HOME/.profile.local"
fi

# BASH
if [ "$BASH" ] && [ -e $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

exec "$@"
