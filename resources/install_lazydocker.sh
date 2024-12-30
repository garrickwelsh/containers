#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local/bin

LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/download/v${LAZYDOCKER_VERSION}/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
tar xf lazydocker.tar.gz lazydocker
chmod 755 lazydocker
rm lazydocker.tar.gz

popd
