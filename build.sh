#!/usr/bin/env nix-shell
#! nix-shell --pure --keep NIX_PATH -p nixUnstable -i bash
set -e -o verbose

nix build \
    --show-trace \
    --experimental-features nix-command \
    --file default.nix \
    minimal