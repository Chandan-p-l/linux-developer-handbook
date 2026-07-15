#!/bin/bash
# install-node.sh
# Installs Node.js using NVM (Node Version Manager) for best practices

set -e

echo "==========================================="
echo " Installing Node.js via NVM "
echo "==========================================="

echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM into current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing the latest LTS version of Node.js..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "==========================================="
echo " Node.js Installation Complete! "
echo "==========================================="
node --version
npm --version
echo "Note: You may need to restart your terminal or run 'source ~/.bashrc' to use 'node' and 'npm'."
