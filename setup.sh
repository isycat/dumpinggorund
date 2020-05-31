function gsdir() {
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

git config --global credential.lastpass "credential-git-lpass" &&
git config --global core.excludesfile $(gsdir $0)/git/ignore &&
git config --global credential.helper lastpass &&

echo "Setup complete"
