#!/bin/bash
# update-system.sh
# Safely updates the Ubuntu system

set -e

echo "==========================================="
echo " Updating Ubuntu System "
echo "==========================================="

echo "1/4: Updating package lists..."
sudo apt-get update

echo "2/4: Upgrading installed packages..."
sudo apt-get upgrade -y

echo "3/4: Removing unused dependencies..."
sudo apt-get autoremove -y

echo "4/4: Cleaning up APT cache..."
sudo apt-get clean

echo "==========================================="
echo " System Update Complete! "
echo "==========================================="
