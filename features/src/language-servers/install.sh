#!/bin/bash

USER=vscode

JQ=$(which jq)

apt-get update

if [[ "$JQ"x == ""x ]]; then
  apt-get install -y jq
fi

if [[ "$OMNISHARP"x == "true"x ]]; then
  OMNISHARP_VERSION=$(curl -s "https://api.github.com/repos/OmniSharp/omnisharp-roslyn/releases/latest" | jq .tag_name |grep -Po 'v\K[^"]*') 
  mkdir -p /tmp/omnisharp && cd /tmp/omnisharp
  curl -sLo omnisharp-linux-x64-net6.0.tar.gz https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${OMNISHARP_VERSION}/omnisharp-linux-x64-net6.0.tar.gz
  tar zxvf omnisharp-linux-x64-net6.0.tar.gz
  pkgname="OmniSharp"
  install -Dm755 OmniSharp *.dll -t"$pkgdir"/usr/lib/omnisharp
  install -Dm644 *.json          -t"$pkgdir"/usr/lib/omnisharp
  install -dm755                   "$pkgdir"/usr/bin
  ln -sf /usr/lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/omnisharp
  ln -sf /usr/lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/OmniSharp
  install -Dm644 license.md        "$pkgdir"/usr/share/licenses/$pkgname/license.md
  cd - && rm -rf /tmp/omnisharp
  su $USER -c "cp -r -H --verbose dot_omnisharp ~/.omnisharp"
fi

if [[ "${DOCKER}"x == "true"x ]]; then
  npm install --global dockerfile-language-server-nodejs
fi
if [[ "${DOCKER_COMPOSE}"x == "true"x ]]; then
  npm install --global @microsoft/compose-language-service
fi
if [[ "${YAML}"x == "true"x ]]; then
  npm install --global yaml-language-server
fi
if [[ "${BASH}"x == "true"x ]]; then
  npm install --global bash-language-server
fi

if [[ "${HTML}"x == "true"x ]]; then
  npm install --global vscode-html-languageservice
fi
if [[ "${CSS}"x == "true"x ]]; then
  npm install --global vscode-css-languageservice
fi
if [[ "${TYPESCRIPT}"x == "true"x ]]; then
  npm install --global typescript-language-server typescript
fi
if [[ "${VUE}"x == "true"x ]]; then
  npm install --global @vue/language-server
fi

if [[ "${TERRAFORM}"x == "true"x ]]; then
  curl -s https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
  apt-get update
  apt-get install -y terraform-ls
fi

if [[ "$RUST"x == "true" ]]; then
  su $USER -c "rustup component add rust-analyzer"
fi

if [[ "$MARKSMAN"x == "true"x ]]; then
  # Install marksman
  MARKSMAN_VERSION=$(curl -s "https://api.github.com/repos/artempyanykh/marksman/releases/latest" | jq .tag_name | grep -Po '\K[^"]*')
  curl -sLo marksman https://github.com/artempyanykh/marksman/releases/download/$MARKSMAN_VERSION/marksman-linux-x64
  install -Dm755 -t "/usr/local/bin" marksman
fi  
if [[ "$MARKDOWN_OXIDE"x == "true"x ]]; then
  # Install markdown-oxide
  MARKDOWN_OXIDE_VERSION=$(curl -s "https://api.github.com/repos/Feel-ix-343/markdown-oxide/releases/latest" | jq .tag_name | grep -Po 'v\K[^"]*')
  curl -sLo markdown-oxide https://github.com/Feel-ix-343/markdown-oxide/releases/download/v$MARKDOWN_OXIDE_VERSION/markdown-oxide-v${MARKDOWN_OXIDE_VERSION}-x86_64-unknown-linux-gnu
  install -Dm755 -t "/usr/local/bin" markdown-oxide
  rm markdown-oxide
fi

if [[ "$CODEBOOK"x == "true"x ]]; then
  CODEBOOK_VERSION=$(curl -s "https://api.github.com/repos/blopker/codebook/releases/latest" | jq .tag_name | grep -Po 'v\K[^"]*')
  curl -sLo codebook-lsp-x86_64-unknown-linux-musl.tar.gz https://github.com/blopker/codebook/releases/download/v$CODEBOOK_VERSION/codebook-lsp-x86_64-unknown-linux-musl.tar.gz 
  tar zxf codebook-lsp-x86_64-unknown-linux-musl.tar.gz --group=root --owner=root
  rm codebook-lsp-x86_64-unknown-linux-musl.tar.gz
  install -Dm755 -t "/usr/local/bin" codebook-lsp
  rm codebook-lsp
fi

if [[ "$LTEX_LS_PLUS"x == "true"x ]]; then
  pushd /usr/local
  LTEX_VERSION=$(curl -s "https://api.github.com/repos/ltex-plus/ltex-ls-plus/releases/latest" | jq -r .tag_name)
  curl -sLo ltex-ls.tar.gz https://github.com/ltex-plus/ltex-ls-plus/releases/download/${LTEX_VERSION}/ltex-ls-plus-${LTEX_VERSION}-linux-x64.tar.gz

  tar zxf ltex-ls.tar.gz ./ltex-ls-plus-${LTEX_VERSION}
  install ltex-ls-plus-${LTEX_VERSION}/lib/* /usr/local/lib
  install ltex-ls-plus-${LTEX_VERSION}/bin/* /usr/local/bin
  mv ltex-ls-plus-${LTEX_VERSION}/jdk* /usr/local
  rm -r ltex-ls-plus-${LTEX_VERSION}
  rm ltex-ls.tar.gz 
  popd
fi

if [[ "$JQ"x == ""x ]]; then
  dpkg --remove jq
fi
apt-get clean
