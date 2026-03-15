#!/usr/bin/env bash

set -e

PROJECT_NAME="markme"
INSTALL_DIR="$HOME/.local/lib/$PROJECT_NAME"
SYMLINK="$HOME/.local/bin/$PROJECT_NAME"

echo "Uninstalling $PROJECT_NAME..."

# Remove symlink
if [ -L "$SYMLINK" ]; then
    rm "$SYMLINK"
    echo "✓ Removed symlink: $SYMLINK"
else
    echo "✗ Symlink not found: $SYMLINK"
fi

# Remove installation directory
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    echo "✓ Removed directory: $INSTALL_DIR"
else
    echo "✗ Directory not found: $INSTALL_DIR"
fi

echo ""
echo "✓ $PROJECT_NAME uninstalled successfully!"
echo "To reinstall: ./scripts/install.sh"
