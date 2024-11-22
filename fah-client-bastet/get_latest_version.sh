#!/bin/bash

DEBIAN_FRONTEND="noninteractive" apt-get -y install jq curl

ARCH=$(uname -m)

case $ARCH in
x86_64)
    export ARCH_PATH="10-64bit"
    ARCH="amd64"
    ;;
aarch64)
    export ARCH_PATH="stable-arm64"
    ARCH="arm64"
    ;;
*)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

# LATEST_VERSION=$(curl -s https://download.foldingathome.org/releases/public/fah-client/meta.json | jq -r '.[] | select((.package | contains("debian")) and (.package | contains("release")) and (.package | contains("'$ARCH_PATH'")) and (.package | contains(".deb"))) | .version | join(".")')
LATEST_VERSION=$(curl -s https://download.foldingathome.org/releases/${FAH_RELEASE}/fah-client/meta.json | jq -r '.[] | select((.package | contains("debian")) and (.package | contains("release")) and (.package | contains("'$ARCH_PATH'")) and (.package | contains(".deb"))) | .version | join(".")')

echo "Building for $ARCH version $LATEST_VERSION"

echo "LATEST_VERSION=$LATEST_VERSION" >>${GITHUB_ENV}
