#!/bin/bash

# aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin

# Pass
# https://qiita.com/fmgieu/items/8fe43cb84e00fc4c45b0
sudo apt install pass

# aws-vault
sudo curl -L -o /usr/local/bin/aws-vault https://github.com/99designs/aws-vault/releases/latest/download/aws-vault-linux-$(dpkg --print-architecture)
sudo chmod 755 /usr/local/bin/aws-vault
