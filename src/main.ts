import { marked } from "marked";
import TerminalRender from "marked-terminal";
import { readFile } from "node:fs/promises";
import { resolve } from "node:path";
import minimist from 'minimist';

const args = minimist(process.argv.slice(2), {
  string: ['path'],
  boolean: ['help', 'version'],
  alias: {
    h: 'help',
    v: 'version',
  },
});


function showHelp() {
  console.log(`
Usage: markme [options] <file.md>
Options:
 -h, --help         Show help
 -v, --version      Show version info
 --path             Markdown file path
`);
}

if (args.help) {
  showHelp()
  process.exit(0);
}

if (args.version) {
  console.log("markme v1.0.0");
}

// Skip first argument - node, second - file itself
// Get the path - verify the path and file length
async function getPathContent(file: string): Promise<string> {
  return await getContent(file);
}

// Verifies path for security measures
// Returns content or success or error
async function getContent(file: string): Promise<string> {
  const filePath = resolve(file);
  const contents = await readFile(filePath, { encoding: "utf-8" });
  return contents;
}

async function render(args) {

  let file = args.path || args._[0];

  if (!file) {
    console.error("Error: No file specified");
    showHelp();
    process.exit(1);
  }

  // initiate marked render
  marked.setOptions({ renderer: new TerminalRender() });

  try {
    const content = await getPathContent(file);
    console.log(marked(content));
  } catch (err) {
    console.error("Error: " + err.message);
    process.exit(1);
  }

}

render(args);
