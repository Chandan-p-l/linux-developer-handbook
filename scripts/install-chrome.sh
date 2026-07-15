#!/bin/bash
# install-chrome.sh
# Downloads and installs the latest Google Chrome stable version

set -e

echo "==========================================="
echo " Installing Google Chrome "
echo "==========================================="

cd /tmp
echo "Downloading Chrome .deb package..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "Installing Google Chrome..."
sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt-get install -f -y

echo "Cleaning up..."
rm google-chrome-stable_current_amd64.deb

echo "==========================================="
echo " Google Chrome Installation Complete! "
echo "==========================================="
google-chrome --version
