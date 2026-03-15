import { describe, it, expect } from 'vitest';
import { execSync } from 'node:child_process';


describe('markme CLI', () => {

  it('should show help with --help', () => {
    const output = execSync('node markme.js --help', { encoding: 'utf-8' });
    expect(output).toContain('Usage');
  })

  it('should render markdown file', () => {
    const output = execSync('node markme.js tests/test.md', { encoding: 'utf-8' });
    expect(output).toBeTruthy();

  })

  it('it should error on missing file', () => {
    expect(() => {
      execSync('node markme.js nonexistent.md');
    }).toThrow();
  })
})

