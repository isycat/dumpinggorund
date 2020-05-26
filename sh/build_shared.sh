cmd=""
mvn_default="mvn"
npm_default="npm"
if [ -f "pom.xml" ]; then
    if [ ! -z "$1" ]; then
        cmd="${MVN_CMD-$mvn_default} $1"
    else
        cmd="${MVN_CMD-$mvn_default} clean install"
    fi
elif [ -f "package.json" ]; then
    if [ ! -z "$1" ]; then
        cmd="${NPM_CMD-$npm_default} $1"
    else
        cmd="${NPM_CMD-$npm_default} start"
    fi
elif [ -f "Makefile" ]; then
    mk $1
else
    echo "Build system not detected in directory"
    exit 1
fi

$cmd
