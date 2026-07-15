#!/bin/bash
# optimize.sh
# Optimizes the Ubuntu system specifically for running on an external SSD
# Reduces write cycles to prolong SSD lifespan

set -e

echo "==========================================="
echo " Optimizing Ubuntu for External SSD "
echo "==========================================="

echo "1. Reducing Swappiness (Current value: $(cat /proc/sys/vm/swappiness))"
echo "A lower swappiness value reduces how often the system writes to the swap file on the SSD."
# Temporarily set for this session
sudo sysctl vm.swappiness=10
# Make it persistent
if ! grep -q "vm.swappiness=10" /etc/sysctl.conf; then
  echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
fi

echo "2. Setting noatime in fstab (prevents writing access times for every file read)"
echo "Note: This script assumes your root partition is ext4. If it's already optimized, this will do nothing."
sudo sed -i 's/errors=remount-ro/errors=remount-ro,noatime/g' /etc/fstab

echo "3. Trimming SSD..."
sudo fstrim -v /

echo "==========================================="
echo " Optimization Complete! "
echo " Please reboot for all changes to take full effect."
echo "==========================================="
