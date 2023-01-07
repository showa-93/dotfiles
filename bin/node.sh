#!/bin/bash
. bin/util.sh
# https://github.com/nodenv/nodenv

exists_package nodenv

git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
~/.nodenv/bin/nodenv init
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
