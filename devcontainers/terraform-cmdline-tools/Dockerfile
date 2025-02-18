FROM mcr.microsoft.com/devcontainers/base:noble as intermediate

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

COPY resources/dot_config/ .config

WORKDIR /workspaces

######### Code Snippets ###########

  # Setup vscode user if they don't already exist
  # && groupadd --gid $USER_GID $USERNAME \
  # && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  # && chmod 0440 /etc/sudoers.d/$USERNAME \
