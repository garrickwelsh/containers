FROM mcr.microsoft.com/devcontainers/base:noble as intermediate

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

  # Install just
RUN  JUST_VERSION=$(curl -s "https://api.github.com/repos/casey/just/releases/latest" | jq -r .tag_name) \ 
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
  && install -Dm644 -t "${pkgdir}/usr/local/share/zsh/site-functions/" "completions/${pkgname}.zsh" 

######### Code Snippets ###########

  # Setup vscode user if they don't already exist
  # && groupadd --gid $USER_GID $USERNAME \
  # && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  # && chmod 0440 /etc/sudoers.d/$USERNAME \
