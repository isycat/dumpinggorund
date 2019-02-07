export PATH="~/bin:$PATH"
export PS1='\w: ' # terminal format

alias reload="source ~/.bashrc"

alias simquote="shuf -n 1 ~/w/dumpinggorund/.simquotes.txt"

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
# --------------------------------------------------------------------------------








