function add-to-path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}
function add-to-path-end() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
add-to-path "~/bin"

export PS1='\[\e[35m\]\w\[\e[39m\]: ' # terminal format
export prompt=$'%{\e[35m%}%~%{\e[39m%}: '
export CLICOLOR=1
export LESS=r

alias reload="source ~/.bashrc"

function getScriptDir() {
    if [ "$0" = "-bash" ]; then
        echo "$(realpath "$(dirname "$BASH_SOURCE")")"
    else
        script_dir=$(dirname $1)
        if [ $script_dir = '.' ]; then
            script_dir="$(pwd)"
        fi
        echo "$script_dir"
    fi
}
alias get-script-dir=getScriptDir
function getBinDir() {
    echo "$(getScriptDir $@)/../bin"
}
add-to-path "$(getBinDir $0)"

# general shell -----------------------------
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

function precmd() {
    # sets the tab title to current dir
    currentDirectory=$(dirs)
    if [ ${#currentDirectory} -ge 16 ]; then
        currentDirectory=$(echo $currentDirectory | sed 's!.*/!!')
    fi
    echo -ne "\e]1;$currentDirectory\a"
}

if [ "$SHELL" = "$(which zsh)" ]; then
    DISABLE_UPDATE_PROMPT=true
    setopt extendedglob
    zstyle ':completion:*' completer _complete _ignored _approximate
    autoload -Uz compinit
    # for dump in ~/.zcompdump(N.mh+24); do
    #     compinit
    # done
    unsetopt EXTENDEDGLOB
    compinit -C
fi
# -------------------------------------------


# most important ----------------------------
alias simquote="shuf -n 1 ~/w/dumpinggorund/.simquotes.txt"
alias piratequote="shuf -n 1 ~/w/dumpinggorund/.piratequotes.txt"
# -------------------------------------------


# lastpass ----------------------------------
alias lp='lpass'
function lpp() {
    lpass show $1 | ag 'Password: \K.+' -o | less
}
function lp-login() {
    touch /tmp/LPASS_TRIGGER
    printf "Lastpass login: "
    read lpassuser < /dev/tty > /dev/tty
    lpass login $lpassuser #> /dev/null
    wait
}
function lp-trigger-check() {
    if [ ! -f /tmp/LPASS_TRIGGER ]; then
        lpass ls > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            lp-login
        fi
    elif [ $(find /tmp/LPASS_TRIGGER -mmin +720 -print) ]; then
        lpass ls > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            lp-login
        fi
    fi
}
# trigger on prompt
# PS1+="\$(lp-trigger-check)"
# prompt+="\$(lp-trigger-check)"
# -------------------------------------------


# git
alias g='git'
alias gd='git diff'
alias gc='git commit'
alias amend='git commit --amend'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A; git status'
alias gch='git checkout'
alias gl='git log --graph --decorate'
alias glo='git log --graph --decorate --oneline'
alias gr='git reset'
alias restash='git stash; git pull --rebase; git stash pop'
function restashAllDirectories() {
    echo "stash-pulling all directories";
    for d in *
    do
        cd $d;
        echo "---- $d - Stash > Rebase > Pop ----";
        git stash clear;
        git stash;
        git pull --rebase;
        git stash pop;
        cd ..;
    done
}
alias restashall=restashAllDirectories
function fetchAllDirectories() {
    echo "stash-pulling all directories";
    for d in *
    do
        cd $d;
        echo "---- $d - Fetching... ----";
        git fetch;
        cd ..;
    done
}
alias fetchall=fetchAllDirectories
function allStatus() {
    echo "fetching all directories";
    for d in *
    do
        cd $d;
        echo "---- $d ----";
        git status;
        cd ..;
    done
}
alias gsa=allStatus
function git-token() {
    lpp github-token-general
}
function new-pr() {
    repo=$(git config --get remote.origin.url | sed 's/.*\/\([^ ]*\/[^.]*\).*/\1/')
    branch=$(git symbolic-ref --short HEAD)
    new_url="https://github.com/$repo/pull/new/$branch"
    python -m webbrowser $new_url
}
alias pr=new-pr
# --------------------------------------------------------------------------------


# kube
alias k=kubectl
alias kx=kubectx
# -------------------------------------------
