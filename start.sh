#!/usr/bin/env sh
set -eu

ANT_VERSION="1.10.15"
PROJECT_DIR=$(dirname -- "$0")

if command -v ant >/dev/null 2>&1; then
    ANT_COMMAND=ant
else
    ANT_HOME="${PROJECT_DIR}/.tools/apache-ant-${ANT_VERSION}"
    ANT_COMMAND="${ANT_HOME}/bin/ant"

    if [ ! -x "${ANT_COMMAND}" ]; then
        mkdir -p "${PROJECT_DIR}/.tools"
        ARCHIVE="${PROJECT_DIR}/.tools/apache-ant-${ANT_VERSION}-bin.tar.gz"
        URL="https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz"

        if command -v curl >/dev/null 2>&1; then
            curl -fsSL --retry 3 --connect-timeout 20 -o "${ARCHIVE}" "${URL}"
        elif command -v wget >/dev/null 2>&1; then
            wget -q -O "${ARCHIVE}" "${URL}"
        else
            echo "Apache Ant ${ANT_VERSION} is required; install ant or provide curl/wget for bootstrap." >&2
            exit 127
        fi

        tar -xzf "${ARCHIVE}" -C "${PROJECT_DIR}/.tools"
        rm -f "${ARCHIVE}"
    fi
fi

exec "${ANT_COMMAND}" -f "${PROJECT_DIR}/build.xml" run
