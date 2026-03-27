# markme

Markdown preview in terminal.

## Installation

```bash
# Using pnpm
pnpm add -g markme

# Using npm
npm install -g markme

# Or clone and install locally
git clone https://github.com/oliviermugishak/markme.git
cd markme
pnpm install
pnpm build
./install.sh
```

## Usage

```bash
# Render a markdown file
markme file.md

# Show help
markme --help

# Show version
markme --version
```

## Options

| Flag | Description |
|------|-------------|
| `-h, --help` | Show help message |
| `-v, --version` | Show version info |
| `--path` | Specify markdown file path |

## Example

```bash
markme README.md
```

## Development

```bash
# Install dependencies
pnpm install

# Build
pnpm build

# Run tests
pnpm test

# Run locally
node markme.js file.md
```

## License

MIT

## Author

**Olivier Mugisha K**

GitHub: [@oliviermugishak](https://github.com/oliviermugishak)
