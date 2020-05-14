cmd=""
if [ -f "pom.xml" ]; then
    if [ ! -z "$1" ]; then
        cmd="mvn $1"
    else
        cmd="mvn clean install"
    fi
elif [ -f "package.json" ]; then
    if [ ! -z "$1" ]; then
        cmd="npm $1"
    else
        cmd="npm start"
    fi
else
    echo "Build system not detected in directory"
    exit 1
fi

$cmd
