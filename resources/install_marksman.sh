#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local/bin

MARKSMAN_VERSION=$(curl -s "https://api.github.com/repos/artempyanykh/marksman/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*')
wget https://github.com/artempyanykh/marksman/releases/download/$MARKSMAN_VERSION/marksman-linux-x64
mv -f marksman-linux-x64 marksman

chmod 755 marksman

popd
