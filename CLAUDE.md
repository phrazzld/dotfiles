# CLAUDE.md - Dotfiles Repository Guide

## Commands
- `python display_random_quote.py` - Display a random quote from indexed quotes
- `python index_quotes.py` - Index quotes from Obsidian vault
- `./handoff.sh file1 [file2 ...]` - Copy file contents to clipboard with formatting

## Code Style Guidelines
- **Python**: Use PEP 8 style guide (4-space indentation, snake_case for variables/functions)
- **Shell Scripts**: Use POSIX-compatible syntax when possible, with clear error handling
- **Configuration Files**: Maintain consistent indentation (2 spaces for YAML)
- **Error Handling**: Check for file existence and command availability before use
- **Documentation**: Include usage information in script headers

## Repository Structure
- Root directory contains utility scripts
- `/zoboomafoo/` - Terminal configuration files
  - `alacritty.yml` and themes
  - `tmuxinator/` - Tmux session configurations
- `/serenity/` - Additional configuration files

## Best Practices
- Keep scripts focused on single responsibilities
- Check for required dependencies before executing
- Support cross-platform functionality where possible