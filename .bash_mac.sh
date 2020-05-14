## MAC
export PATH="~/Library/Python/2.7/bin:$PATH"
export PATH="/opt/apache-maven/bin:$PATH"

alias editconfig='open -a "Sublime Text" ~/.bash_profile'
alias reload='source ~/.bash_profile'
ln -sfn $(/usr/libexec/java_home) ~/java_home

alias b="~/w/dumpinggorund/build.sh"
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

eval $(thefuck --alias ffs)

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
export PATH=/usr/local/mysql/bin:$PATH
