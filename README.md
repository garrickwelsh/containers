# Containers 
This repository contains devcontainer, devcontainer feature and container definitions that are utilised to provide tools and environments for my use (and anyone else).

## Devcontainers
Development containers - Environments for building code.

### Goals
* A developer environment that can be reused for multiple projects and shifts the load of devcontainer builds to the server. 
* Command line tools are a first class citizen.
* Support for Helix and Neovim.

## Devcontainer features

These features are a convenience to quickly get command line tools installed for use within devcontainers. They are broken up into cmdline-tools, language servers and preparation/setup.

### Features

Includes the following:
* Editors
	* helix
	* neovim
	* lunarvim (neovim distro)
* Language servers
	* marksman
	* markdown-oxide
* just
* ripgrep

## TODO
* Include Dockerfile language server

## Flavours

### Rust
A devcontainer with development tools installed for rust, installed via rustup.
Installs stable and nightly, setting the default as stable.
Includes rust-analyzer rust-docs rust-src clippy cargo rustfmt 
Includes docker-from-docker for container support.

### Dotnet (csharp)
A devcontainer with development tools install for dotnet (c#). Installed using devcontainer features and then embedded in the image.
This image includes sensible defaults for omnisharp. These may be override with your own by mounting your omnisharp folder which will take prescidence over the one included.
Includes docker-in-docker for dotnet aspire support.

## Containers

### Languagetool
Language tool service to provide spelling and grammar checking.
