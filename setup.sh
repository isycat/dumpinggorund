script_dir=$(dirname $0)
if [ $script_dir = '.' ]; then
    script_dir="$(pwd)"
fi

git config --global core.excludesfile $script_dir/git/ignore &&

echo "Setup complete"
