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
    script_dir=$(dirname $1)
    if [ $script_dir = '.' ]; then
        script_dir="$(pwd)"
    fi
    echo "$script_dir"
}
alias get-script-dir=getScriptDir
function getBinDir() {
    echo "$(getScriptDir $@)/../bin"
}
add-to-path "$(getBinDir $0)"

alias simquote="shuf -n 1 ~/w/dumpinggorund/.simquotes.txt"
alias piratequote="shuf -n 1 ~/w/dumpinggorund/.piratequotes.txt"

alias lp='lpass'

function lpp() {
    lpass show $1 | ag 'Password: \K.+' -o | less
}

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

# git
alias g='git'
alias gd='git diff'
alias gc='git commit'
alias amend='git commit --amend'
alias gs='git status'
alias ga='git add'
alias gaa='git add *; git status'
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
alias git-token='lpp github-token-general'
# --------------------------------------------------------------------------------

function cf() {
    printf "protocol=https\nhost=github.com\nusername=$(lpass show --password github-token-general)\npassword=$(lpass show --password github-token-general)\n" | git credential fill >> /dev/null
    echo "git creds updated"
}
