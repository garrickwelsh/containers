#!/bin/bash

# This should be called by postcreate.sh as the vscode user.

sudo apt update && sudo apt install neovim

if [ -d ~/.config/nvim/.git ]; then
  echo "Updating Lazyvim"
  pushd ~/.config/nvim
  git pull --depth 1
  popd
elif [ -d ~/.config/nvim ]; then
  echo "Neovim config exists leave"
else
  mkdir -p ~/.config
  git clone --depth 1 https://github.com/LazyVim/starter ~/.config/nvim
fi
