#!/bin/bash
# install-docker.sh
# Installs Docker Engine and Docker Compose following the official guide

set -e

echo "==========================================="
echo " Installing Docker & Docker Compose "
echo "==========================================="

echo "1. Removing old versions (if any)..."
sudo apt-get remove docker docker-engine docker.io containerd runc || true

echo "2. Setting up the repository..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "3. Installing Docker Engine..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "4. Adding user to the docker group (avoid sudo for docker commands)..."
sudo groupadd docker || true
sudo usermod -aG docker $USER

echo "==========================================="
echo " Docker Installation Complete! "
echo "==========================================="
docker --version
docker compose version
echo ""
echo "IMPORTANT: Please log out and log back in (or restart) for the group changes to take effect."
