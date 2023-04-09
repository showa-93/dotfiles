#!/bin/bash
. bin/util.sh

sudo apt update -y

# Install VS Code extensions
cat vscode/extentions.txt | xargs -i code --install-extension {}

if is_linux || is_wsl; then
  sudo apt install jq
  sudo apt install bw
  sudo apt install gh

  # AWS CLI version 2
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install

  # gcloud CLI
  snap install google-cloud-cli --classic
fi