#!/bin/bash

apt-get update
apt-get install -y scons build-essential libssl-dev binutils-dev libleveldb-dev libsnappy-dev git nodejs npm bind9-dnsutils ssl-cert

mkdir build
cd build

git clone https://github.com/cauldrondevelopmentllc/cbang
git clone https://github.com/foldingathome/fah-node

export CBANG_HOME=$PWD/cbang

scons -C cbang
scons -C fah-node
scons -C fah-node package

dpkg --unpack fah-node/fah-node_$(cat fah-node/version.txt)_amd64.deb

