#!/bin/bash
# restore.sh
# Restores a backup archive to the home directory

set -e

if [ -z "$1" ]; then
  echo "Usage: ./restore.sh <path-to-backup-archive.tar.gz>"
  exit 1
fi

ARCHIVE_PATH="$1"

if [ ! -f "$ARCHIVE_PATH" ]; then
  echo "Error: Archive $ARCHIVE_PATH not found!"
  exit 1
fi

echo "==========================================="
echo " Restoring System Backup "
echo "==========================================="

echo "WARNING: This will overwrite files in your home directory."
read -p "Are you sure you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Restore cancelled."
    exit 1
fi

echo "Extracting archive to / ..."
sudo tar -xzvf "$ARCHIVE_PATH" -C /

echo "==========================================="
echo " Restore Complete! "
echo "==========================================="
