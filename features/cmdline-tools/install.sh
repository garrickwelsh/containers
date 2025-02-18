#!/bin/bash

USER=vscode

# Install dotnet tooling
if [[ "$DOTNET_OUTDATED"x == "true"x ]]; then
  dotnet tool install --global dotnet-outdated-tool
fi

if [[ "$DOTNET_EF"x == "true"x ]]; then
  dotnet tool install --global dotnet-ef
fi

if [[ "$DOTNET_SQLPACKAGE"x == "true"x ]]; then
  # Install support for Sql projects
  dotnet tool install --global Microsoft.SqlPackage
fi

if [[ "$JUST"x == "true"x ]]; then
  JUST_VERSION=$(curl -s "https://api.github.com/repos/casey/just/releases/latest" | jq -r .tag_name) 
  pkgname=just
  mkdir -p /tmp/omnisharp
  cd /tmp/omnisharp
  curl -Lo just.tar.gz "https://github.com/casey/just/releases/download/${JUST_VERSION}/just-${JUST_VERSION}-x86_64-unknown-linux-musl.tar.gz"
  tar zxvf just.tar.gz
  rm just.tar.gz
  install -Dm755 -t "${pkgdir}/usr/local/bin/" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/local/share/man/man1/" "${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/local/share/licenses/${pkgname}/" "LICENSE"
  install -Dm644 -t "${pkgdir}/usr/local/share/bash-completion/completions/" "completions/${pkgname}.bash"
  install -Dm644 -t "${pkgdir}/usr/local/share/elvish/lib/" "completions/${pkgname}.elvish"
  install -Dm644 -t "${pkgdir}/usr/local/share/fish/vendor_completions.d/" "completions/${pkgname}.fish"
  install -Dm644 -t "${pkgdir}/usr/local/share/zsh/site-functions/" "completions/${pkgname}.zsh"
  cd -
  rm -rf /tmp/omnisharp
fi

if "$DIFFTASTIC"x == "true"x ]]; then
  # Install difftastic
  DIFFT_VERSION=$(curl -s "https://api.github.com/repos/Wilfred/difftastic/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*')
  pkgname=difft
  curl -Lo difft-x86_64-unknown-linux-gnu.tar.gz https://github.com/Wilfred/difftastic/releases/download/${DIFFT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz
  tar zxvf difft-x86_64-unknown-linux-gnu.tar.gz
  rm difft-x86_64-unknown-linux-gnu.tar.gz
  install -Dm755 -t "/usr/local/bin" "${pkgname}"
fi
