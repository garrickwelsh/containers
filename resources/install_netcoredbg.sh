#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local

NETCOREDBG_VERSION=$(curl -s "https://api.github.com/repos/Samsung/netcoredbg/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*')

wget https://github.com/Samsung/netcoredbg/releases/download/${NETCOREDBG_VERSION}/netcoredbg-linux-amd64.tar.gz
tar zxvf netcoredbg-linux-amd64.tar.gz
rm netcoredbg-linux-amd64.tar.gz

pushd ~/.local/bin
ln -sf ../netcoredbg/netcoredbg netcoredbg

popd
popd
