# nixos-digitalocean

This is a minimal NixOS image builder for DigitalOcean.

To build:

```bash
./build.sh
```

Find the result in `result/nixos.qcow2.gz`.

To upload:

```bash
./upload.sh $ARGS...
# Where $ARGS... is your s3cmd args to go after `s3cmd put result/nixos.qcow2.gz`
```