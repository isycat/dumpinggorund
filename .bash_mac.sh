## MAC
export PATH="~/Library/Python/2.7/bin:$PATH"

alias editconfig='open -a "Sublime Text" ~/.bash_profile'
alias reload='source ~/.bash_profile'
ln -sfn $(/usr/libexec/java_home) ~/java_home
export PATH="/apollo/env/SDETools/bin:$PATH"


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
