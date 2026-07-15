#!/bin/bash
# install-dev-tools.sh
# Automates the installation of essential development tools for Ubuntu

set -e

echo "==========================================="
echo " Installing Essential Developer Tools "
echo "==========================================="

echo "Updating package lists..."
sudo apt-get update

echo "Installing build essentials (gcc, make, etc.)..."
sudo apt-get install -y build-essential

echo "Installing Git..."
sudo apt-get install -y git

echo "Installing curl and wget..."
sudo apt-get install -y curl wget

echo "Installing unzip and tar..."
sudo apt-get install -y unzip tar

echo "Installing htop for system monitoring..."
sudo apt-get install -y htop

echo "==========================================="
echo " Installation Complete! "
echo "==========================================="
git --version
curl --version
