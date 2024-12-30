#!/bin/bash

# Setup dotnet certificates for builds
dotnet dev-certs https --clean --import src/Vds.Api/certificate.crt --password 'VDS Development'
dotnet dev-certs https --trust

# Install dotnet tooling
dotnet tool install --global dotnet-outdated-tool
dotnet tool install --global dotnet-ef

# Install support for Sql projects
dotnet tool install --global Microsoft.SqlPackage

# Update the dotnet workloads (includes aspire)
sudo dotnet workload update

# Install lsp for azure pipelines
npm install -g azure-pipelines-language-server

npm install -g dockerfile-language-server-nodejs

# Install marksman
.devcontainer/install_marksman.sh
# Install markdown-oxide
.devcontainer/install_markdown-oxide.sh
# Install difftastic
.devcontainer/install_difftastic.sh
# Install lazydocker
.devcontainer/install_lazydocker.sh

# Install Lazyvim
# .devcontainer/install_lazyvim.sh
# Install gitui
# .devcontainer/install_gitui.sh
# Install lazygit
# .devcontainer/install_lazygit.sh
# Install lunarnvim - Lunar vim is best installed manually.
# .devcontainer/install_lunarnvim.sh
# Install openapi-tui
# .devcontainer/install_openapi-tui.sh

# Update tldr cache
tldr --update

# Configure helix, tmux, git and omnisharp
mkdir -p ~/.config/helix
mkdir -p ~/.config/tmux
mkdir -p ~/.omnisharp
cp .devcontainer/config/helix/config.toml ~/.config/helix
cp .devcontainer/config/helix/languages.toml ~/.config/helix
cp .devcontainer/config/tmux/tmux.conf ~/.config/tmux
cp .devcontainer/config/omnisharp/omnisharp.json ~/.omnisharp

git config --global credential.useHttpPath true
git config --global diff.external difft
# Fix for tmux not displaying unicode characters.
echo "export LANG=en_AU.UTF-8" >> ~/.bashrc
