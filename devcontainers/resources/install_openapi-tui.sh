#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local/bin

OPENAPI_TUI_VERSION=$(curl -s "https://api.github.com/repos/zaghaghi/openapi-tui/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*')
curl -Lo openapi-tui.tar.gz https://github.com/zaghaghi/openapi-tui/releases/download/$OPENAPI_TUI_VERSION/openapi-tui-${OPENAPI_TUI_VERSION}-linux-x86_64.tar.gz

tar zxvf openapi-tui.tar.gz
rm openapi-tui.tar.gz

popd
