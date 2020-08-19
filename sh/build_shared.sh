mvn_default="mvn"
npm_default="npm"
platformio_default="platformio"

function buildstuff() {
    rp="./"
    working_path=${CUR_BUILD_PATH-$rp}
    cmd=""
    if [ -f "$working_path/pom.xml" ]; then
        cmd="${MVN_CMD-$mvn_default} ${1-clean install}"
    elif [ -f "$working_path/package.json" ]; then
        cmd="${NPM_CMD-$npm_default} ${1-start}"
    elif [ -f "$working_path/platformio.ini" ]; then
        cmd="${PLATFORMIO_CMD-$platformio_default} ${1-run}"
    # last checks...
    else
        groot=`git rev-parse --show-cdup`
        if [ "$working_path" == "$groot" ]; then
            # Nothing found in root. Check for Makefiles
            if [ -f "$rp/Makefile" ]; then
                # Makefile found in current dir
                mk $1
            elif [ -f "$groot/Makefile" ]; then
                # Makefile found in root dir
                echo "Root Makefile:"
                mk $1
            else
                echo "Build system not detected"
                exit 1
            fi
        else
            CUR_BUILD_PATH=$groot buildstuff $@
        fi
        exit 0
    fi
    if [ "$working_path" != "$rp" ]; then
        echo "Running from git root"
    fi
    (cd $working_path; $cmd)
}

buildstuff $@
