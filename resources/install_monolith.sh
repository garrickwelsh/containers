#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local/bin

MONOLITH_VERSION=$(curl -s "https://api.github.com/repos/Y2Z/monolith/releases/latest" | jq -r .tag_name)
echo "https://github.com/Y2Z/monolith/releases/download/${MONOLITH_VERSION}/monolith-gnu-linux-x86_64"
curl -Lo monolith-gnu-linux-x86_64 "https://github.com/Y2Z/monolith/releases/download/${MONOLITH_VERSION}/monolith-gnu-linux-x86_64"

mv -f monolith-gnu-linux-x86_64 monolith
chmod 755 monolith

popd
