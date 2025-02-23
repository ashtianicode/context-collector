# Codebase Documentation Script

A simple, portable Perl script to gather and document files in a directory. Easily filter by file patterns and produce a comprehensive single Markdown file.

## Installation

1. **Clone** or **download** this repository to your local machine.
2. Ensure you have a modern Perl installation (5.10+).
3. If needed, install the [File::Slurp](https://metacpan.org/pod/File::Slurp) module:
   ```bash
   cpanm File::Slurp
   ```
   or
   ```bash
   cpan File::Slurp
   ```
4. Make the script executable:
   ```bash
   chmod +x codebase.pl
   ```

## Usage

```bash
./codebase.pl [options]
```

### Options
- `--help, -h`: Show usage information.
- `--dir, -d <directory>`: Directory to scan. Defaults to . (current directory).
- `--output, -o <file>`: Output file. Defaults to codebase.md.
- `--include, -i <patterns>`: Comma-separated patterns to include (case-insensitive).
- `--exclude, -e <patterns>`: Comma-separated patterns to exclude (case-insensitive).

### Examples
1. Default usage:
   ```bash
   ./codebase.pl
   ```
   Scans the current directory, producing codebase.md.

2. Custom directory and output:
   ```bash
   ./codebase.pl --dir myproject --output docs.md
   ```

3. Include only .go and .txt files, exclude pkg and .git:
   ```bash
   ./codebase.pl --include go,txt --exclude pkg,.git
   ```

## Contributing
1. Fork this repository.
2. Create a new branch for your contribution.
3. Commit and push your changes.
4. Open a Pull Request describing the changes.

We welcome feature requests, bug reports, and code improvements!