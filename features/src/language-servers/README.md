
# Language servers (language-servers)

Install language servers to support editors.

## Example Usage

```json
"features": {
    "ghcr.io/garrickwelsh/feature/language-servers:0": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| yaml | Install redhat yaml server | boolean | true |
| bash | Install bash language server | boolean | true |
| docker | Install docker language server | boolean | true |
| docker_compose | Install docker compose language server | boolean | true |
| marksman | Install marksman language server for the markdown language | boolean | true |
| markdown_oxide | Install markdown oxide language server for the markdown language | boolean | true |
| terraform | Install terraform-ls | boolean | true |
| omnisharp | Install omnisharp language server | boolean | false |
| rust | Install rust analyzer (requires rustup) | boolean | false |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
