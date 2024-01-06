#!/bin/bash

CLIENT_VERSION=$1
CLIENT_SOURCE=$2

ARCH=$(uname -m)

case $ARCH in
x86_64)
    ARCH_PATH="10-64bit"
    ARCH="amd64"
    ;;
aarch64)
    ARCH_PATH="stable-arm64"
    ARCH="arm64"
    ;;
*)
    echo "Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

curl -O "https://download.foldingathome.org/releases/${CLIENT_SOURCE}/fah-client/debian-${ARCH_PATH}/release/fah-client_${CLIENT_VERSION}_${ARCH}.deb"
ls -la
dpkg --unpack "fah-client_${CLIENT_VERSION}_${ARCH}.deb"
