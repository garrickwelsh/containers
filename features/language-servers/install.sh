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
  curl -Lo omnisharp-linux-x64-net6.0.tar.gz https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${OMNISHARP_VERSION}/omnisharp-linux-x64-net6.0.tar.gz
  tar zxvf omnisharp-linux-x64-net6.0.tar.gz
  pkgname="OmniSharp"
  install -Dm755 OmniSharp *.dll -t"$pkgdir"/usr/lib/omnisharp
  install -Dm644 *.json          -t"$pkgdir"/usr/lib/omnisharp
  install -dm755                   "$pkgdir"/usr/bin
  ln -sf /usr/lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/omnisharp
  ln -sf /usr/lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/OmniSharp
  install -Dm644 license.md        "$pkgdir"/usr/share/licenses/$pkgname/license.md
  cd - && rm -rf /tmp/omnisha
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

if [[ "${TERRAFORM}"x == "true"x ]]; then
  curl https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
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
  curl -Lo marksman https://github.com/artempyanykh/marksman/releases/download/$MARKSMAN_VERSION/marksman-linux-x64
  install -Dm755 -t "/usr/local/bin" marksman
fi  
if [[ "$MARKDOWN_OXIDE"x == "true"x ]]; then
  # Install markdown-oxide
  MARKDOWN_OXIDE_VERSION=$(curl -s "https://api.github.com/repos/Feel-ix-343/markdown-oxide/releases/latest" | jq .tag_name | grep -Po 'v\K[^"]*')
  curl -Lo markdown-oxide https://github.com/Feel-ix-343/markdown-oxide/releases/download/v$MARKDOWN_OXIDE_VERSION/markdown-oxide-v${MARKDOWN_OXIDE_VERSION}-x86_64-unknown-linux-gnu
  install -Dm755 -t "/usr/local/bin" markdown-oxide
  rm markdown-oxide
fi

if [[ "$JQ"x == ""x ]]; then
  dpkg --remove jq
fi
apt-get clean
