#!/bin/bash

sudo apt update && sudo apt install -y neovim python3-pip cargo

npm install --global tree-sitter-cli

LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
