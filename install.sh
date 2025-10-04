#!/bin/bash
# System-wide Installation Script for Linux Clean Up
# Copyright (C) 2025 WHO-AM-I-404

set -e

echo "========================================="
echo " Linux Clean Up - System Installation"
echo " Version 1.0.1"
echo "========================================="
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Error: This script must be run as root (use sudo)"
    exit 1
fi

# Check if executable exists
if [ ! -f "linux-cleaner" ]; then
    echo "Error: linux-cleaner executable not found!"
    echo "Please run './build.sh' first to build the application."
    exit 1
fi

# Install directories
BIN_DIR="/usr/bin"
ICON_DIR="/usr/share/icons/hicolor"
APPS_DIR="/usr/share/applications"
DOC_DIR="/usr/share/doc/linux-cleaner"
POLKIT_DIR="/usr/share/polkit-1/actions"

echo "Installing Linux Clean Up to system..."
echo ""

# 1. Install executable
echo "[1/6] Installing executable to $BIN_DIR..."
install -Dm755 linux-cleaner "$BIN_DIR/linux-cleaner"

# 2. Install application icons
echo "[2/6] Installing application icons..."
mkdir -p "$ICON_DIR/scalable/apps"
mkdir -p "$ICON_DIR/256x256/apps"
mkdir -p "$ICON_DIR/128x128/apps"
mkdir -p "$ICON_DIR/48x48/apps"

# Install icons if available
if [ -f "images/logo.svg" ]; then
    install -m644 images/logo.svg "$ICON_DIR/scalable/apps/linux-cleaner.svg"
fi

if [ -f "images/linux-cleaner.png" ]; then
    install -m644 images/linux-cleaner.png "$ICON_DIR/256x256/apps/linux-cleaner.png"
fi

# 3. Install desktop entry
echo "[3/6] Installing desktop entry..."
mkdir -p "$APPS_DIR"
cat > "$APPS_DIR/linux-cleaner.desktop" << 'EOF'
[Desktop Entry]
Version=1.1
Type=Application
Name=Linux Clean Up
GenericName=System Cleanup Tool
Comment=Modern GUI for system cleanup and maintenance
Icon=linux-cleaner
Exec=pkexec linux-cleaner
Terminal=false
Categories=System;Utility;
Keywords=cleanup;clean;disk;space;maintenance;cache;trash;
StartupNotify=true
EOF

# 4. Install PolicyKit file
echo "[4/6] Installing PolicyKit policy..."
mkdir -p "$POLKIT_DIR"
if [ -f "com.linux-cleaner.policy" ]; then
    install -m644 com.linux-cleaner.policy "$POLKIT_DIR/com.linux-cleaner.policy"
else
    echo "Warning: com.linux-cleaner.policy not found. Skipping..."
fi

# 5. Install documentation
echo "[5/6] Installing documentation..."
mkdir -p "$DOC_DIR"
[ -f "README.md" ] && install -m644 README.md "$DOC_DIR/README.md"
[ -f "CHANGELOG.md" ] && install -m644 CHANGELOG.md "$DOC_DIR/CHANGELOG.md"
[ -f "LICENSE" ] && install -m644 LICENSE "$DOC_DIR/LICENSE"

# 6. Update icon cache and desktop database
echo "[6/6] Updating system caches..."
if command -v gtk-update-icon-cache &>/dev/null; then
    gtk-update-icon-cache -f -t "$ICON_DIR" 2>/dev/null || true
fi

if command -v update-desktop-database &>/dev/null; then
    update-desktop-database "$APPS_DIR" 2>/dev/null || true
fi

echo ""
echo "========================================="
echo " ✓ Installation completed successfully!"
echo "========================================="
echo ""
echo "Linux Clean Up has been installed system-wide."
echo ""
echo "You can now:"
echo "  • Run from terminal: linux-cleaner"
echo "  • Launch from application menu: Search 'Linux Clean Up'"
echo "  • Find it in System Tools category"
echo ""
echo "To uninstall, run: sudo ./uninstall.sh"
echo ""
