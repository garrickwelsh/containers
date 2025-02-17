FROM ghcr.io/garrickwelsh/devcontainer-cmdline-tools-base AS intermediate

RUN set -x \
  # Install omnisharp
  && OMNISHARP_VERSION=$(curl -s "https://api.github.com/repos/OmniSharp/omnisharp-roslyn/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') \ 
  && mkdir -p /tmp/omnisharp && cd /tmp/omnisharp \
  && curl -Lo omnisharp-linux-x64-net6.0.tar.gz https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v${OMNISHARP_VERSION}/omnisharp-linux-x64-net6.0.tar.gz \
  && tar zxvf omnisharp-linux-x64-net6.0.tar.gz \
  && pkgname="OmniSharp" \
  && install -Dm755 OmniSharp *.dll -t"$pkgdir"/usr/lib/omnisharp \
  && install -Dm644 *.json          -t"$pkgdir"/usr/lib/omnisharp \
  && install -dm755                   "$pkgdir"/usr/bin \
  && ln -sf /usr/lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/omnisharp \
  && ln -sf /usr/lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/OmniSharp \
  && install -Dm644 license.md        "$pkgdir"/usr/share/licenses/$pkgname/license.md \
  && cd - && rm -rf /tmp/omnisharp


######### Code Snippets ###########

  # Setup vscode user if they don't already exist
  # && groupadd --gid $USER_GID $USERNAME \
  # && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  # && chmod 0440 /etc/sudoers.d/$USERNAME \
