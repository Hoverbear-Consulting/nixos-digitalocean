#!/usr/bin/env nix-shell
#! nix-shell --pure --keep NIX_PATH -p s3cmd cacert -i bash

s3cmd put --acl-public result/nixos.qcow2.gz $1