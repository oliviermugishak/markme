#!/usr/bin/env bash

set -e

# Get script directory (handles being called from anywhere)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

# Install deps (--ignore-scripts to prevent infinite loop from package.json install hook)
if [ -d "node_modules" ]; then
    echo "Dependencies already installed"
else
    echo "Installing dependencies..."
    pnpm install --ignore-scripts
fi

echo "Building markme..."
pnpm build

echo "Installing markme..."
mkdir -p ~/.local/lib/markme
mkdir -p ~/.local/bin

cp markme.js ~/.local/lib/markme/

cat > ~/.local/lib/markme/markme-cli << 'EOF'
#!/usr/bin/env node
require('./markme.js')
EOF

chmod +x ~/.local/lib/markme/markme.js
chmod +x ~/.local/lib/markme/markme-cli

ln -sf ~/.local/lib/markme/markme-cli ~/.local/bin/markme

echo ""
echo "✓ Markme installed successfully!"
echo ""
echo "Usage: markme <file.md>"
echo "Example: markme README.md"
