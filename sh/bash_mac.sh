## MAC
function add-to-path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1${PATH:+":$PATH"}"
    fi
}
add-to-path "~/Library/Python/2.7/bin"
add-to-path "/opt/apache-maven/bin"
export GROOVY_HOME=/usr/local/opt/groovy/libexec

alias editconfig='open -a "Sublime Text" ~/.bash_profile'
alias reload='source ~/.zshrc'
( ln -sfn $(/usr/libexec/java_home) ~/java_home &)  &> /dev/null

alias b="~/w/dumpinggorund/sh/build_mac.sh"
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

if command -v thefuck >/dev/null 2>&1; then
  ffs() {
    eval "$(thefuck --alias ffs)" && ffs
  }
fi

alias ll='ls -l'
alias la='/bin/ls -a'
alias lls='/bin/ls'
function ls() {
    /bin/ls $@ -d (*|.*)
}

function nozzz() {
    let "dur = 60 * 60 * $1"
    echo "no z's for $dur seconds"
    caffeinate -disu -t $dur &
}

function extract-certs() {
    openssl s_client -connect $1:443 -showcerts </dev/null 2>/dev/null | sed -n '/^-----BEGIN CERT/,/^-----END CERT/p'
}

# Calendar/Org
alias org-today="python3.7 ~/Downloads/sync-calendar.py"

    # uses jq
function prettyme() {
	potato=$(less $1);
	echo $potato | jq '.' > $1
}

alias spc=openemacsokay
function openemacsokay() {
	# /Applications/Emacs.app/Contents/MacOS/Emacs $1 &
    open -n -a /Applications/Emacs.app/Contents/MacOS/Emacs $1 &
	echo ":)"
}

alias sub='open -a "Sublime Text"'
alias sublime='open -a "Sublime Text"'
alias dif='/Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea diff'

## ------------------------------------------------------------
add-to-path "/usr/local/mysql/bin"
