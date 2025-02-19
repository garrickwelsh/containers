
# cmdline tools (cmdline-tools)

Download the latest cmdline and tui tools.

## Example Usage

```json
"features": {
    "ghcr.io/garrickwelsh/feature/cmdline-tools:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| dotnet_outdated | Install dotnet outdated | boolean | true |
| dotnet_ef | Install dotnet entity framework command line utilities | boolean | true |
| dotnet_sqlpackage | Install dotnet sqlpackage | boolean | true |
| just | Install just - handy way to save and run project-specific commands - https://github.com/casey/just | boolean | true |
| difftastic | Install difftastic and setup as default git diff tool | boolean | true |
| neovim | Install neovim editor | boolean | true |
| helix | Install the helix editor | boolean | true |
| ripgrep | Install ripgrep | boolean | true |
| tealdeer | Install tealdeer a rust implementation of tldr. | boolean | true |
| gitui | Install gitui a terminal ui for git. | boolean | true |
| lazygit | Install lazygit a terminal ui for git. | boolean | true |
| lazydocker | Install lazydocker a terminal ui for docker. | boolean | true |
| oxker | Install oxker a terminal ui for docker. | boolean | true |
| k9s | Install k9s a terminal ui for kubernetes. | boolean | true |
| jq | Install jq a cmdline utility for manipulating json. | boolean | true |
| tmux | Install tmux a terminal multiplexer. | boolean | true |
| rustup | Install rustup and lldb to develop rust. | boolean | false |
| rustup_toolchain | Install rustup and lldb to develop rust. | string | stable |
| lang | Set the language (locale) for the container. Default value is en_US.UTF-8. | string | en_US.UTF-8 |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
