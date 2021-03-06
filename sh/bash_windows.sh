PATH="$PATH:~/.local/bin/"
alias run="cmd.exe /c"
set prefer-visible-bell on
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set prefer-visible-bell on'

alias run="cmd.exe /c"

alias b="~/w/dumpinggorund/sh/build_windows.sh"

alias trigga-test="sudo ssh ubuntu@trigga-test.isy.cat -i /e/trigga-test.pem"

function rrggmu {
    var0=`find -L -maxdepth 3 -name .git -type d -prune`
    gitdirs=`dirname $var0`
    mu register $gitdirs > /dev/null
}
function _function_ws {
    rrggmu;

    if [ -z "$1" ]; then
        mu st
    else
        mu $1
    fi

    # clean up the mu config
    rm .mu_repo;
}

alias ws=_function_ws

# cd ~
