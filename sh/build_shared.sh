mvn_default="mvn"
npm_default="npm"
platformio_default="platformio"

cmd=""

if [ -f "pom.xml" ]; then
    cmd="${MVN_CMD-$mvn_default} ${1-clean install}"
elif [ -f "package.json" ]; then
    cmd="${NPM_CMD-$npm_default} ${1-start}"
elif [ -f "platformio.ini" ]; then
    cmd="${PLATFORMIO_CMD-$platformio_default} ${1-run}"
# last check...
elif [ -f "Makefile" ]; then
    mk $1
else
    echo "Build system not detected in directory"
    exit 1
fi

$cmd
