
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
| dotnet_outdated | Install dotnet outdated | boolean | false |
| dotnet_ef | Install dotnet entity framework command line utilities | boolean | false |
| dotnet_sqlpackage | Install dotnet sqlpackage | boolean | false |
| dotnet_swagger_cli | Install dotnet swagger utility | boolean | false |
| dotnet_azure_functions | Install azure function tools azd and azure-function-core-tools-4 | boolean | false |
| just | Install just - handy way to save and run project-specific commands - https://github.com/casey/just | boolean | true |
| difftastic | Install difftastic and setup as default git diff tool | boolean | true |
| neovim | Install neovim editor | boolean | true |
| helix | Install the helix editor | boolean | true |
| ripgrep | Install ripgrep | boolean | true |
| tealdeer | Install tealdeer a rust implementation of tldr. | boolean | true |
| bat | Install bat a cat replacement | boolean | true |
| gitui | Install gitui a terminal ui for git. | boolean | true |
| lazygit | Install lazygit a terminal ui for git. | boolean | true |
| lazydocker | Install lazydocker a terminal ui for docker. | boolean | true |
| oxker | Install oxker a terminal ui for docker. | boolean | true |
| k9s | Install k9s a terminal ui for kubernetes. | boolean | true |
| jq | Install jq a cmdline utility for manipulating json. | boolean | true |
| yq | Install yq a cmdline utility for manipulating yaml, json, xml, csv and tsv. | boolean | true |
| skopeo | Install skopeo to command line utility that performs various operations on container images and image repositories. | boolean | true |
| syft | Install syft a utility to generate a software bill of materials (SBOM). | boolean | true |
| grype | Install grype to find vulnerabilities from a software bill of materials (SBOM). | boolean | true |
| cosign | Install cosign a command line utility that signs container images. | boolean | true |
| oasdiff | Install oasdiff to compare openapi specifications. | boolean | true |
| net_utils | Install network utilities - ping, route, nslookup, dig, nmap, traceroute | boolean | true |
| tmux | Install tmux a terminal multiplexer. | boolean | true |
| rustup | Install rustup and lldb to develop rust. | boolean | false |
| rustup_toolchain | Install rustup and lldb to develop rust. | string | stable |
| serie | Install serie a terminal git history visualisation tool (better view of branches in history). | boolean | true |
| localstack | Install localstack cmdline utility to create aws tooling. | boolean | false |
| localstack_tf | Install localstack terraform cmdline utility to infrastructure in localstack. | boolean | false |
| localstack_aws | Install localstack aws cmdline utility to manage infrastructure in localstack. | boolean | false |
| lang | Set the language (locale) for the container. Default value is en_US.UTF-8. | string | en_US.UTF-8 |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
