FROM ghcr.io/garrickwelsh/devcontainer-cmdline-tools-base AS intermediate

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

  # Install just
RUN  curl https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
  && apt-get update \
  && apt-get install -y terraform-ls


COPY resources/dot_config/ .config

WORKDIR /workspaces

######### Code Snippets ###########

  # Setup vscode user if they don't already exist
  # && groupadd --gid $USER_GID $USERNAME \
  # && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  # && chmod 0440 /etc/sudoers.d/$USERNAME \
