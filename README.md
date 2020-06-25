# nixos-digitalocean

This is a minimal NixOS image builder for DigitalOcean.

# Prerequisites

You need `nix-shell` available with a `$NIX_PATH` set, this project uses pure `nix-shell` shebangs and it won't touch anything else.

If you want to upload, `s3cmd` must be configured and using `~/.s3cfg`.

> TODO: Support AWS `s3cmd` env vars.

# Usage

To build:

```bash
./build.sh
```

Find the result in `result/nixos.qcow2.gz`. 

To upload via `s3cmd`:

```bash
./upload.sh "s3://hoverbear/nixos-dev.qcow2.gz"
```