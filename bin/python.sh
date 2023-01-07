#!/bin/bash
. bin/util.sh
# https://github.com/pyenv/pyenv

exists_package pyenv

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
