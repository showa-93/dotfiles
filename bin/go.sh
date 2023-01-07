#!/bin/bash
. bin/util.sh
# https://go.dev/doc/install

exists_package go

if is_linux || is_wsl; then
  version=1.19.4 &&
    wget https://golang.org/dl/go${version}.linux-amd64.tar.gz &&
    sudo rm -rf /usr/local/go &&
    sudo tar -C /usr/local -xzf go${version}.linux-amd64.tar.gz &&
    rm -r go${version}.linux-amd64.tar.gz
fi
