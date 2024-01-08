#!/bin/bash

apt-get update
apt-get install -y curl scons build-essential libssl-dev binutils-dev libleveldb-dev libsnappy-dev git nodejs npm bind9-dnsutils ssl-cert

cd /tmp && mkdir build && cd build

git clone https://github.com/cauldrondevelopmentllc/cbang
git clone https://github.com/foldingathome/fah-node

export CBANG_HOME=$PWD/cbang

scons -C cbang
scons -C fah-node
scons -C fah-node package

ls -la fah-node/*

dpkg --unpack fah-node/fah-node_*_amd64.deb
