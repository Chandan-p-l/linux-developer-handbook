#!/bin/bash
# backup.sh
# Simple script to backup the user's home directory (excluding heavy folders)

set -e

BACKUP_DIR="/mnt/data/backups"
DATE=$(date +"%Y-%m-%d")
ARCHIVE_NAME="home-backup-$DATE.tar.gz"

echo "==========================================="
echo " Creating System Backup "
echo "==========================================="

# Ensure backup directory exists
sudo mkdir -p "$BACKUP_DIR"
sudo chown $USER:$USER "$BACKUP_DIR"

echo "Backing up $HOME to $BACKUP_DIR/$ARCHIVE_NAME..."

# Exclude Cache, Node modules, and hidden massive directories
tar -czvf "$BACKUP_DIR/$ARCHIVE_NAME" \
  --exclude="$HOME/.cache" \
  --exclude="$HOME/.nvm" \
  --exclude="$HOME/.npm" \
  --exclude="$HOME/node_modules" \
  --exclude="$HOME/Downloads" \
  "$HOME"

echo "==========================================="
echo " Backup Complete! "
echo " Saved to: $BACKUP_DIR/$ARCHIVE_NAME"
echo "==========================================="
