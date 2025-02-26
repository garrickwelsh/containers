#!/bin/bash

USER=vscode

apt-get update
apt-get install -y software-properties-common jq

if [[ "$JUST"x == "true"x ]]; then
  APPLICATION=just
  echo "##### Installing $APPLICATION #####"
  JUST_VERSION=$(curl -s "https://api.github.com/repos/casey/just/releases/latest" | jq -r .tag_name) 
  pkgname=just
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
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$DIFFTASTIC"x == "true"x ]]; then
  # Install difftastic
  APPLICATION=difftastic
  echo "##### Installing $APPLICATION #####"
  DIFFT_VERSION=$(curl -s "https://api.github.com/repos/Wilfred/difftastic/releases/latest" | jq -r .tag_name)
  pkgname=difft
  curl -Lo difft-x86_64-unknown-linux-gnu.tar.gz https://github.com/Wilfred/difftastic/releases/download/${DIFFT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz
  tar zxvf difft-x86_64-unknown-linux-gnu.tar.gz
  rm difft-x86_64-unknown-linux-gnu.tar.gz
  install -Dm755 -t "/usr/local/bin" "${pkgname}"
  su $USER -c "git config --global diff.external difft"
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$HELIX"x == "true"x ]]; then
  APPLICATION=helix
  echo "##### Installing $APPLICATION #####"
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
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$NEOVIM"x == "true"x ]]; then
  APPLICATION=neovim
  echo "##### Installing $APPLICATION #####"
  add-apt-repository ppa:neovim-ppa/unstable
  apt-get update
  apt-get install -y neovim
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$TEALDEER"x == "true"x ]]; then
  APPLICATION=tealdeer
  echo "##### Installing $APPLICATION #####"
  apt-get install -y tealdeer
  su $USER -c "tldr --update"
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$RIPGREP"x == "true"x ]]; then
  APPLICATION=ripgrep
  echo "##### Installing $APPLICATION #####"
  apt-get install -y ripgrep
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$TMUX"x == "true"x ]]; then
  APPLICATION=tmux
  echo "##### Installing $APPLICATION #####"
  apt-get install -y tmux
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$NET_UTILS"x == "true"x ]]; then
  APPLICATION="network utilities"
  echo "##### Installing $APPLICATION #####"
  apt-get install -y net-tools nmap traceroute iputils-ping tlslookup dnsutils
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$GITUI"x == "true"x ]]; then
  APPLICATION=gitui
  GITUI_VERSION=$(curl -s "https://api.github.com/repos/extrawurst/gitui/releases/latest" | jq -r .tag_name)
  echo "##### Installing $APPLICATION - $GITUI_VERSION #####"
  curl -Lo gitui-linux-x86_64.tar.gz "https://github.com/extrawurst/gitui/releases/download/${GITUI_VERSION}/gitui-linux-x86_64.tar.gz"
  tar xvf gitui-linux-x86_64.tar.gz
  rm gitui-linux-x86_64.tar.gz
  install -Dm755 -t "/usr/local/bin" gitui
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$LAZYGIT"x == "true"x ]]; then
  APPLICATION=lazygit
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | jq -r .tag_name | grep -Po 'v\K[^"]*')
  echo "##### Installing $APPLICATION  - $LAZYGIT_VERSION #####"
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar zxf lazygit.tar.gz lazygit
  install -Dm755 -t "/usr/local/bin" lazygit
  rm lazygit.tar.gz
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$LAZYDOCKER"x == "true"x ]]; then
  APPLICATION=lazydocker
  LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | jq -r .tag_name | grep -Po 'v\K[^"]*')
  echo "##### Installing $APPLICATION - $LAZYDOCKER_VERSION #####"
  curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/download/v${LAZYDOCKER_VERSION}/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
  tar zxf lazydocker.tar.gz lazydocker
  install -Dm755 -t "/usr/local/bin" lazydocker
  rm lazydocker.tar.gz
  echo "##### Installed $APPLICATION #####"
fi


if [[ "$OXKER"x == "true"x ]]; then
  APPLICATION=oxker
  OXKER_VERSION=$(curl -s "https://api.github.com/repos/mrjackwills/oxker/releases/latest" | jq -r .tag_name | grep -Po 'v\K[^"]*')
  echo "##### Installing $APPLICATION - $OXKER_VERSION #####"
  curl -Lo oxker.tar.gz https://github.com/mrjackwills/oxker/releases/download/v${OXKER_VERSION}/oxker_linux_x86_64.tar.gz
  tar zxf oxker.tar.gz oxker
  install -Dm755 -t "/usr/local/bin" oxker
  rm oxker.tar.gz
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$K9S"x == "true"x ]]; then
  APPLICATION=k9s
  K9S_VERSION=$(curl -s "https://api.github.com/repos/derailed/k9s/releases/latest" | jq -r .tag_name | grep -Po 'v\K[^"]*')
  echo "##### Installing $APPLICATION - $K9S_VERSION #####"
  curl -Lo k9s_linux_amd64.deb https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_linux_amd64.deb
  dpkg --install k9s_linux_amd64.deb 
  rm k9s_linux_amd64.deb 
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$SERIE"x == "true"x ]]; then
  APPLICATION=serie
  SERIE_VERSION=$(curl -s "https://api.github.com/repos/lusingander/serie/releases/latest" | jq -r .tag_name | grep -Po 'v\K[^"]*')
  echo "##### Installing $APPLICATION - $SERIE_VERSION #####"
  curl -Lo serie.tar.gz https://github.com/lusingander/serie/releases/download/v${SERIE_VERSION}/serie-${SERIE_VERSION}-x86_64-unknown-linux-gnu.tar.gz
  tar zxvf serie.tar.gz
  rm serie.tar.gz
  install -Dm755 -t "/usr/local/bin" serie
  rm serie
  echo "##### Installed $APPLICATION #####"
fi

# Install dotnet tooling
if [[ "$DOTNET_OUTDATED"x == "true"x ]]; then
  APPLICATION=dotnet_outdated
  echo "##### Installing $APPLICATION #####"
  su $USER -c "dotnet tool install --global dotnet-outdated-tool"
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$DOTNET_EF"x == "true"x ]]; then
  APPLICATION=dotnet_ef
  echo "##### Installing $APPLICATION #####"
  su $USER -c "dotnet tool install --global dotnet-ef"
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$DOTNET_SQLPACKAGE"x == "true"x ]]; then
  # Install support for Sql projects
  APPLICATION=dotnet_sqlpackage
  echo "##### Installing $APPLICATION #####"
  su $USER -c "dotnet tool install --global Microsoft.SqlPackage"
  echo "##### Installed $APPLICATION #####"
fi

if [[ "$RUSTUP"x == "true"x ]]; then
  APPLICATION=rustup
  echo "##### Installing $APPLICATION #####"
  apt-get install -y rustup lldb
  su $USER -c "rustup default $RUSTUP_TOOLCHAIN"
  su $USER -c "rustup toolchain install $RUSTUP_TOOLCHAIN"
  su $USER -c "rustup component add cargo clippy rustfmt rust-docs rust-src"
  echo "##### Installed $APPLICATION #####"
fi

echo "##### Start setting locale #####"
echo "LANG=\"${LANG}\"" > /etc/locale.conf
locale-gen "$LANG"
echo "##### Ended setting locale #####"
echo "##### Copying default sensible configuration for devcontainer cmdline utilities #####"
su $USER -c "ls -lh"
su $USER -c "cp -r -H --verbose dot_config/* ~/.config"
echo "##### copied default sensible configuration for devcontainer cmdline utilities #####"

if [[ "$JQ"x == "false"x ]]; then
  dpkg --remove jq
fi

apt-get clean
su $USER -c "echo \"export LANG=\\\"${LANG}\\\"\" >> ~/.bashrc"
