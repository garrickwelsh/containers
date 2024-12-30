#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local/bin

DIFFT_VERSION=$(curl -s "https://api.github.com/repos/Wilfred/difftastic/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*')
wget https://github.com/Wilfred/difftastic/releases/download/${DIFFT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz
tar zxvf difft-x86_64-unknown-linux-gnu.tar.gz
rm difft-x86_64-unknown-linux-gnu.tar.gz

popd
