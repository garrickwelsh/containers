#!/bin/bash

mkdir -p ~/.local/bin
pushd ~/.local/bin

MARKDOWN_OXIDE_VERSION=$(curl -s "https://api.github.com/repos/Feel-ix-343/markdown-oxide/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo markdown-oxide-download https://github.com/Feel-ix-343/markdown-oxide/releases/download/v$MARKDOWN_OXIDE_VERSION/markdown-oxide-v${MARKDOWN_OXIDE_VERSION}-x86_64-unknown-linux-gnu

mv -f markdown-oxide-download markdown-oxide
chmod 755 markdown-oxide

popd
