#!/usr/bin/env bash

# NixOS installation script
set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 machine-name"
    exit 1
fi

MACHINE=$1
REPO_DIR="/mnt/etc/nixos"
HOST_DIR="$REPO_DIR/hosts/$MACHINE"
CONFIG_FILE="hardware-configuration.nix"

mkdir -p "$HOST_DIR"

nixos-generate-config --root /mnt 

if [ ! -f "$REPO_DIR/$CONFIG_FILE" ]; then
    echo "Error: Failed to generate hardware configuration"
    exit 1
fi

mv "$REPO_DIR/$CONFIG_FILE" "$HOST_DIR/$CONFIG_FILE"

cd "$REPO_DIR"
git add "$HOST_DIR/$CONFIG_FILE"

echo "Installing NixOS for $MACHINE..."
nixos-install --flake "$REPO_DIR#$MACHINE"

if [ $? -eq 0 ]; then
    echo "NixOS installation completed successfully."
else
    echo "NixOS installation failed."
    exit 1
fi
