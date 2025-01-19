FROM  ghcr.io/garrickwelsh/devcontainer-hugo

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

WORKDIR /tmp/build

RUN set -x \
  && apt-get update \
  && apt-get install -y software-properties-common \
  # && add-apt-repository ppa:maveonair/helix-editor \
  # && add-apt-repository ppa:neovim-ppa/unstable \
  # && apt-get update \
  # && apt-get install -y helix tmux tealdeer ripgrep neovim \
  && add-apt-repository ppa:neovim-ppa/unstable \
  && apt-get update \
  && apt-get install -y tmux tealdeer ripgrep neovim \
  && locale-gen en_AU.UTF-8 && echo "LANG=en_AU.UTF-8" > /etc/locale.conf \
  # Install just
  && JUST_VERSION=$(curl -s "https://api.github.com/repos/casey/just/releases/latest" | jq -r .tag_name) \ 
  && pkgname=just \
  && curl -Lo just.tar.gz "https://github.com/casey/just/releases/download/${JUST_VERSION}/just-${JUST_VERSION}-x86_64-unknown-linux-musl.tar.gz" \
  && tar zxvf just.tar.gz \
  && rm just.tar.gz \
  && install -Dm755 -t "${pkgdir}/usr/local/bin/" "${pkgname}" \
  && install -Dm644 -t "${pkgdir}/usr/local/share/man/man1/" "${pkgname}.1" \
  && install -Dm644 -t "${pkgdir}/usr/local/share/licenses/${pkgname}/" "LICENSE" \
  && install -Dm644 -t "${pkgdir}/usr/local/share/bash-completion/completions/" "completions/${pkgname}.bash" \
  && install -Dm644 -t "${pkgdir}/usr/local/share/elvish/lib/" "completions/${pkgname}.elvish" \
  && install -Dm644 -t "${pkgdir}/usr/local/share/fish/vendor_completions.d/" "completions/${pkgname}.fish" \
  && install -Dm644 -t "${pkgdir}/usr/local/share/zsh/site-functions/" "completions/${pkgname}.zsh" \
  # Install difftastic
  && DIFFT_VERSION=$(curl -s "https://api.github.com/repos/Wilfred/difftastic/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*') \ 
  && pkgname=difft \
  && curl -Lo difft-x86_64-unknown-linux-gnu.tar.gz https://github.com/Wilfred/difftastic/releases/download/${DIFFT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz \
  && tar zxvf difft-x86_64-unknown-linux-gnu.tar.gz \
  && rm difft-x86_64-unknown-linux-gnu.tar.gz \
  && install -Dm755 -t "/usr/local/bin" "${pkgname}" \
  # lunarvim pre-requistes
  && apt-get install -y python3-pip npm \ 
  && npm install --global tree-sitter-cli dockerfile-language-server-nodejs @microsoft/compose-language-service \
  # Install Git UI
  && GITUI_VERSION=$(curl -s "https://api.github.com/repos/extrawurst/gitui/releases/latest" | jq -r .tag_name) \
  && curl -Lo gitui-linux-x86_64.tar.gz "https://github.com/extrawurst/gitui/releases/download/${GITUI_VERSION}/gitui-linux-x86_64.tar.gz" \
  && tar xvf gitui-linux-x86_64.tar.gz \
  && rm gitui-linux-x86_64.tar.gz \
  && install -Dm755 -t "/usr/local/bin" gitui \
  # Install marksman
  && MARKSMAN_VERSION=$(curl -s "https://api.github.com/repos/artempyanykh/marksman/releases/latest" | \grep -Po '"tag_name": *"\K[^"]*') \
  && curl -Lo marksman https://github.com/artempyanykh/marksman/releases/download/$MARKSMAN_VERSION/marksman-linux-x64 \
  && install -Dm755 -t "/usr/local/bin" marksman \
  # Install markdown-oxide
  && MARKDOWN_OXIDE_VERSION=$(curl -s "https://api.github.com/repos/Feel-ix-343/markdown-oxide/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') \
  && curl -Lo markdown-oxide https://github.com/Feel-ix-343/markdown-oxide/releases/download/v$MARKDOWN_OXIDE_VERSION/markdown-oxide-v${MARKDOWN_OXIDE_VERSION}-x86_64-unknown-linux-gnu \
  && install -Dm755 -t "/usr/local/bin" markdown-oxide \
  && rm markdown-oxide \
  && apt-get install -y asciinema \
  && LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') \
  && curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
  && tar zxf lazygit.tar.gz lazygit \
  && install -Dm755 -t "/usr/local/bin" lazygit \
  && rm lazygit.tar.gz \
  # Install helix to get the latest version
  && HELIX_VERSION=$(curl -s "https://api.github.com/repos/helix-editor/helix/releases/latest" | jq -r .tag_name) \
  && curl -Lo helix-${HELIX_VERSION}-x86_64-linux.tar.xz https://github.com/helix-editor/helix/releases/download/${HELIX_VERSION}/helix-${HELIX_VERSION}-x86_64-linux.tar.xz \
  && tar Jxf helix-${HELIX_VERSION}-x86_64-linux.tar.xz \
  && cd helix-${HELIX_VERSION}-x86_64-linux \
  && install -Dm755 -t "/usr/local/bin" hx \
  && install -Dm644 -d "/usr/local/lib/helix" runtime \
  && install -Dm644 -T contrib/completion/hx.bash "/usr/share/bash-completion/completions/hx" \
  && install -Dm644 -T contrib/completion/hx.fish "/usr/share/fish/vendor_completions.d/hx.fish" \
  && install -Dm644 -T contrib/completion/hx.zsh "/usr/share/zsh/site-functions/_hx" \
  && cd .. \
  && rm -r helix-${HELIX_VERSION}-x86_64-linux \
  && rm helix-${HELIX_VERSION}-x86_64-linux.tar.xz \
  # clean up
  && apt-get clean \
  && rm -r * \
  && echo "Done"

WORKDIR /workspaces

USER $USERNAME

WORKDIR /home/$USERNAME

RUN set -x \
     && sudo rmdir /tmp/build \
     # Install lunarvim (tree-sitter-cli is required to install lunarvim)
     && LV_BRANCH='release-1.4/neovim-0.9' \
     && curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/${LV_BRANCH}/utils/installer/install.sh|bash \
     # Set difftastic as diff util
     && git config --global diff.external difft \ 
     # Fix for tmux not displaying unicode characters.
     && echo "export LANG=en_AU.UTF-8" >> ~/.bashrc

COPY resources/dot_config/ .config

