#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local/bin

GUTUI_VERSION=$(curl -s "https://api.github.com/repos/extrawurst/gitui/releases/latest" | jq -r .tag_name)
echo "https://github.com/extrawurst/gitui/releases/download/${GUTUI_VERSION}/gitui-linux-x86_64.tar.gz"
curl -Lo gitui-linux-x86_64.tar.gz "https://github.com/extrawurst/gitui/releases/download/${GUTUI_VERSION}/gitui-linux-x86_64.tar.gz"
tar xvf gitui-linux-x86_64.tar.gz
rm gitui-linux-x86_64.tar.gz

popd
