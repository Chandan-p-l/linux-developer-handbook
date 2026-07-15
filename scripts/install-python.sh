#!/bin/bash
# install-python.sh
# Installs Python 3, pip, and sets up a virtual environment best practice

set -e

echo "==========================================="
echo " Installing Python 3 & pip "
echo "==========================================="

echo "Updating package lists..."
sudo apt-get update

echo "Installing Python 3, pip, and venv..."
sudo apt-get install -y python3 python3-pip python3-venv

echo "==========================================="
echo " Python Installation Complete! "
echo "==========================================="
python3 --version
pip3 --version

echo ""
echo "Tip: Always use virtual environments for your Python projects!"
echo "Example: python3 -m venv myenv && source myenv/bin/activate"
