#!/usr/bin/env nix-shell
#! nix-shell --pure  -p s3cmd cacert -i bash

DEFAULT_DESTINATION="s3://hoverbear/nixos-dev.qcow2.gz"
DESTINATION=${1:-${DEFAULT_DESTINATION}}

s3cmd put --acl-public result/nixos.qcow2.gz ${DESTINATION}