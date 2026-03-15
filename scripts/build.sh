#!/usr/bin/env bash

set -e

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "Building markme..."

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    pnpm install
fi

# Build
pnpm build

# Verify
if [ -f "markme.js" ]; then
    echo "✓ Build successful: markme.js"
else
    echo "✗ Build failed: markme.js not found"
    exit 1
fi
