#!/usr/bin/env bash

set -e

pnpm install
pnpm build 

mkdir -p ~/.local/lib/markme

cp markme.js ~/.local/lib/markme/

cat > ~/.local/lib/markme/markme-cli << 'EOF'
#!/usr/bin/env node
require('./markme.js')
EOF

chmod +x ~/.local/lib/markme/markme.js
chmod +x ~/.local/lib/markme/markme-cli

ln -sf ~/.local/lib/markme/markme-cli ~/.local/bin/markme

echo "Markme installed successfully!"
echo "Try: markme test.md"
