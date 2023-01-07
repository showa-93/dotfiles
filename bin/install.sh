#!/bin/bash

# Install VS Code extensions
cat vscode/extentions.txt | xargs -i code --install-extension {}
