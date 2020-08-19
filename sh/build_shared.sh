mvn_default="mvn"
npm_default="npm"
platformio_default="platformio"

function auto_build() {
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
        git_root=`git rev-parse --show-cdup`
        if [ "$working_path" == "$git_root" ]; then
            # Nothing found in root. Check for Makefiles
            if [ -f "$rp/Makefile" ]; then
                # Makefile found in current dir
                mk $1
            elif [ -f "$git_root/Makefile" ]; then
                # Makefile found in root dir
                echo "Root Makefile:"
                mk $1
            else
                echo "Build system not detected"
                exit 1
            fi
        else
            CUR_BUILD_PATH=$git_root auto_build $@
        fi
        exit 0
    fi
    if [ "$working_path" != "$rp" ]; then
        echo "Running from git root"
    fi
    (cd $working_path; $cmd)
}

auto_build $@
