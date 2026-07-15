#!/bin/bash
# install-vscode.sh
# Installs Visual Studio Code (Microsoft) via the official APT repository

set -e

echo "==========================================="
echo " Installing Visual Studio Code "
echo "==========================================="

echo "1. Installing dependencies..."
sudo apt-get update
sudo apt-get install -y software-properties-common apt-transport-https wget

echo "2. Importing Microsoft GPG key..."
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

echo "3. Enabling the VS Code repository..."
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

echo "4. Installing VS Code..."
sudo apt-get update
sudo apt-get install -y code

echo "==========================================="
echo " VS Code Installation Complete! "
echo "==========================================="
code --version
echo "You can now launch it by typing 'code' in the terminal."
