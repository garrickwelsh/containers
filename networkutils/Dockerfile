FROM mcr.microsoft.com/devcontainers/base:noble as intermediate

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
  && apt install -y net-tools nmap curl netcat-traditional dnsutils procps lsof \
  && apt-get clean \
  && rm -r * \
  && echo "Done"

