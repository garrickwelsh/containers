#!/bin/bash

mkdir -p /tmp/omnisharp
pushd /tmp/omnisharp

OMNISHARP_VERSION=$(curl -s "https://api.github.com/repos/OmniSharp/omnisharp-roslyn/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
wget https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${OMNISHARP_VERSION}/omnisharp-linux-x64-net6.0.tar.gz

tar zxvf omnisharp-linux-x64-net6.0.tar.gz

pkgname="OmniSharp"

install -Dm755 OmniSharp *.dll -t"$pkgdir"/usr/lib/omnisharp
install -Dm644 *.json          -t"$pkgdir"/usr/lib/omnisharp
install -dm755                   "$pkgdir"/usr/bin
ln -sf ../lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/omnisharp
ln -sf ../lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/OmniSharp
install -Dm644 license.md        "$pkgdir"/usr/share/licenses/$pkgname/license.md

popd
