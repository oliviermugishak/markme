#!/usr/bin/env bash

set -e

# Get script directory (handles being called from anywhere)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "Building markme..."
pnpm install
pnpm build

echo "Installing markme..."
mkdir -p ~/.local/lib/markme

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
