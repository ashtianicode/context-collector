# Context Collector for LLMs

A lightweight (60-line) Perl script that helps collect and organize codebase context for LLMs. Perfect for gathering relevant code snippets and files before sending them to your favorite LLM.

## Features
- Quick context gathering from any directory
- Flexible file filtering with include/exclude patterns
- Outputs a single, clean Markdown file ready for LLM consumption
- Maintains file structure and organization in the output
- Extremely portable - just needs Perl and one module

## Installation

1. **Clone** or **download** this repository
2. Ensure you have Perl 5.10+ installed
3. Install the required [File::Slurp](https://metacpan.org/pod/File::Slurp) module:
   ```bash
   cpanm File::Slurp
   ```
   or
   ```bash
   cpan File::Slurp
   ```
4. Make the script executable:
   ```bash
   chmod +x context-collector.pl
   ```

## Usage

```bash
./context-collector.pl [options]
```

### Options
- `--help, -h`: Show usage information
- `--dir, -d <directory>`: Directory to scan (defaults to current directory)
- `--output, -o <file>`: Output file (defaults to codebase.md)
- `--include, -i <patterns>`: Comma-separated patterns to include (case-insensitive)
- `--exclude, -e <patterns>`: Comma-separated patterns to exclude (case-insensitive)

### Examples
1. Collect context from current directory:
   ```bash
   ./context-collector.pl
   ```

2. Gather context from a specific project:
   ```bash
   ./context-collector.pl --dir my-project --output context.md
   ```

3. Focus on specific file types while excluding irrelevant directories:
   ```bash
   ./context-collector.pl --include py,js,jsx --exclude node_modules,venv
   ```

## Contributing
1. Fork this repository
2. Create a new branch for your contribution
3. Commit and push your changes
4. Open a Pull Request

We welcome feature requests, bug reports, and improvements!