#!/bin/bash
# System-wide Uninstallation Script for Linux Clean Up
# Copyright (C) 2025 WHO-AM-I-404

set -e

echo "========================================="
echo " Linux Clean Up - Uninstallation"
echo " Version 1.0.1"
echo "========================================="
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Error: This script must be run as root (use sudo)"
    exit 1
fi

# Define install paths
BIN_DIR="/usr/bin"
SHARE_DIR="/usr/share/linux-cleaner"
ICON_DIR="/usr/share/icons/hicolor"
APPS_DIR="/usr/share/applications"
DOC_DIR="/usr/share/doc/linux-cleaner"
POLKIT_FILE="/usr/share/polkit-1/actions/com.linux-cleaner.policy"

echo "Removing Linux Clean Up from system..."
echo ""

# 1. Remove executable
echo "[1/6] Removing executable..."
rm -f "$BIN_DIR/linux-cleaner"

# 2. Remove application icons
echo "[2/6] Removing application icons..."
rm -f "$ICON_DIR/scalable/apps/linux-cleaner.svg"
rm -f "$ICON_DIR/256x256/apps/linux-cleaner.png"
rm -f "$ICON_DIR/128x128/apps/linux-cleaner.png"
rm -f "$ICON_DIR/48x48/apps/linux-cleaner.png"

# 3. Remove desktop entry
echo "[3/6] Removing desktop entry..."
rm -f "$APPS_DIR/linux-cleaner.desktop"

# 4. Remove PolicyKit policy
echo "[4/6] Removing PolicyKit file..."
rm -f "$POLKIT_FILE"

# 5. Remove documentation and data
echo "[5/6] Removing documentation and shared data..."
rm -rf "$DOC_DIR" "$SHARE_DIR"

# 6. Update system caches
echo "[6/6] Updating system caches..."
if command -v gtk-update-icon-cache &> /dev/null; then
    gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null || true
fi

if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$APPS_DIR" 2>/dev/null || true
fi

# Optional: restart polkit to unload old policy
if systemctl is-active --quiet polkit; then
    systemctl restart polkit 2>/dev/null || true
fi

echo ""
echo "========================================="
echo " ✓ Uninstallation completed successfully!"
echo "========================================="
echo ""
echo "Linux Clean Up has been completely removed from your system."
echo ""
