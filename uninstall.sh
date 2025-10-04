#!/bin/bash
# =========================================
# Linux Clean Up - Uninstallation Script
# Version 1.0.1
# Copyright (C) 2025 WHO-AM-I-404
# =========================================

set -e

echo "========================================="
echo " Linux Clean Up - Uninstallation"
echo " Version 1.0.1"
echo "========================================="
echo ""

# --- Root check ---
if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be run as root (use sudo)"
    exit 1
fi

# --- Define paths ---
BIN_DIR="/usr/bin"
SHARE_DIR="/usr/share/linux-cleaner"
ICON_BASE="/usr/share/icons/hicolor"
APP_DIR="/usr/share/applications"
DOC_DIR="/usr/share/doc/linux-cleaner"
POLKIT_FILE="/usr/share/polkit-1/actions/com.linux-cleaner.policy"

echo "Removing Linux Clean Up from system..."
echo ""

# --- Helper for safe remove ---
safe_rm() {
    local target="$1"
    if [[ -e "$target" || -L "$target" ]]; then
        rm -rf "$target" >/dev/null 2>&1 || true
    fi
}

# --- 1. Executable ---
echo "[1/6] Removing executable..."
safe_rm "$BIN_DIR/linux-cleaner"

# --- 2. Icons ---
echo "[2/6] Removing application icons..."
for size in scalable 256x256 128x128 48x48; do
    safe_rm "$ICON_BASE/$size/apps/linux-cleaner.png"
    safe_rm "$ICON_BASE/$size/apps/linux-cleaner.svg"
done

# --- 3. Desktop entry ---
echo "[3/6] Removing desktop entry..."
safe_rm "$APP_DIR/linux-cleaner.desktop"

# --- 4. PolicyKit file ---
echo "[4/6] Removing PolicyKit configuration..."
safe_rm "$POLKIT_FILE"

# --- 5. Documentation & shared data ---
echo "[5/6] Removing documentation and shared data..."
safe_rm "$DOC_DIR"
safe_rm "$SHARE_DIR"

# --- 6. Update caches ---
echo "[6/6] Updating system caches..."
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache -f -t "$ICON_BASE" >/dev/null 2>&1 || true
fi

if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$APP_DIR" >/dev/null 2>&1 || true
fi

# --- Optional: reload PolicyKit (only if systemd is present) ---
if command -v systemctl >/dev/null 2>&1; then
    if [[ "$(ps -p 1 -o comm=)" == "systemd" ]] && systemctl is-active --quiet polkit; then
        systemctl restart polkit >/dev/null 2>&1 || true
    fi
fi

echo ""
echo "========================================="
echo " ✓ Uninstallation completed successfully!"
echo "========================================="
echo ""
echo "Linux Clean Up has been completely removed from your system."
echo ""
