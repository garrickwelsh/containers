#!/bin/bash

USER=vscode

apt-get update
apt-get install -y software-properties-common jq

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
  DIFFT_VERSION=$(curl -s "https://api.github.com/repos/Wilfred/difftastic/releases/latest" | jq .tag_name)
  pkgname=difft
  curl -Lo difft-x86_64-unknown-linux-gnu.tar.gz https://github.com/Wilfred/difftastic/releases/download/${DIFFT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz
  tar zxvf difft-x86_64-unknown-linux-gnu.tar.gz
  rm difft-x86_64-unknown-linux-gnu.tar.gz
  install -Dm755 -t "/usr/local/bin" "${pkgname}"
  su $USER -c "git config --global diff.external difft"
fi

if [[ "$HELIX"x == "true"x ]]; then
  # Install helix to get the latest version
  HELIX_VERSION=$(curl -s "https://api.github.com/repos/helix-editor/helix/releases/latest" | jq -r .tag_name)
  curl -Lo helix-${HELIX_VERSION}-x86_64-linux.tar.xz https://github.com/helix-editor/helix/releases/download/${HELIX_VERSION}/helix-${HELIX_VERSION}-x86_64-linux.tar.xz
  tar Jxf helix-${HELIX_VERSION}-x86_64-linux.tar.xz
  cd helix-${HELIX_VERSION}-x86_64-linux
  install -Dm755 -t "/usr/local/bin" hx
  mv runtime "/usr/local/bin"
  install -Dm644 -T contrib/completion/hx.bash "/usr/share/bash-completion/completions/hx"
  install -Dm644 -T contrib/completion/hx.fish "/usr/share/fish/vendor_completions.d/hx.fish"
  install -Dm644 -T contrib/completion/hx.zsh "/usr/share/zsh/site-functions/_hx"
  cd ..
  rm -r helix-${HELIX_VERSION}-x86_64-linux
  rm helix-${HELIX_VERSION}-x86_64-linux.tar.xz
fi

if [[ "$NEOVIM"x == "true"x ]]; then
  add-apt-repository ppa:neovim-ppa/unstable
  apt-get update
  apt-get install -y neovim
fi
if [[ "$TEALDEER"x == "true"x ]]; then
  apt-get install -y tmux tealdeer ripgrep
fi
if [[ "$RIPGREP"x == "true"x ]]; then
  apt-get install -y ripgrep
fi
if [[ "$TMUX"x == "true"x ]]; then
  apt-get install -y tmux
fi
if [[ "$GITUI"x == "true"x ]]; then
  GITUI_VERSION=$(curl -s "https://api.github.com/repos/extrawurst/gitui/releases/latest" | jq -r .tag_name)
  curl -Lo gitui-linux-x86_64.tar.gz "https://github.com/extrawurst/gitui/releases/download/${GITUI_VERSION}/gitui-linux-x86_64.tar.gz"
  tar xvf gitui-linux-x86_64.tar.gz
  rm gitui-linux-x86_64.tar.gz
  install -Dm755 -t "/usr/local/bin" gitui
fi
if [[ "$lazygit"x == "true"x ]]; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | jq .tag_name | grep -Po 'v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar zxf lazygit.tar.gz lazygit
  install -Dm755 -t "/usr/local/bin" lazygit
  rm lazygit.tar.gz
fi
if [[ "$K9S"x == "true"x ]]; then
  K9S_VERSION=$(curl -s "https://api.github.com/repos/derailed/k9s/releases/latest" | jq .tag_name | grep -Po 'v\K[^"]*')
  curl -Lo k9s_linux_amd64.deb https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_linux_amd64.deb
  dpkg --install k9s_linux_amd64.deb 
  rm k9s_linux_amd64.deb 
fi

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

if [[ "$JQ"x == "false"x ]]; then
  dpkg --remove jq
fi

apt-get clean
su $USER -c 'echo "export LANG=en_AU.UTF-8" >> ~/.bashrc'
