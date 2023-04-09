#!/bin/bash
# https://github.com/pyenv/pyenv

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
