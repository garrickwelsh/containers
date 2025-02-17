FROM ghcr.io/garrickwelsh/devcontainer-cmdline-tools-base AS intermediate

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN set -x \
  && apt-get update \
  # Rust specific
  && apt-get install -y rustup lldb \ 
  # clean up
  && apt-get clean \
  && echo "Done"

WORKDIR /workspaces

USER $USERNAME

WORKDIR /home/$USERNAME

RUN set -x \
     && echo "Install rust tools" \
     && rustup default stable \
     && rustup toolchain install stable \
     && rustup component add rust-analyzer rust-docs rust-src clippy cargo rustfmt \
     && rustup toolchain install nightly

COPY resources/dot_config/ .config

######### Code Snippets ###########

  # Setup vscode user if they don't already exist
  # && groupadd --gid $USER_GID $USERNAME \
  # && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  # && chmod 0440 /etc/sudoers.d/$USERNAME \
