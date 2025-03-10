# CLAUDE.md - Dotfiles Repository Guide

## Commands
- `zsh -c "source ~/.zshrc"` - Reload shell configuration

## Code Style Guidelines
- **Shell**: Use POSIX-compatible syntax with `if [[ -n "$var" ]]; then` style conditionals
- **Error Handling**: Check file existence (`-f`), command availability, and use error messages
- **Functions**: Document with inline comments above each function
- **Configuration Files**: Use 2-space indentation for YAML and consistent structure
- **Git**: Use conventional commits (`feat:`, `fix:`, `docs:`, `style:`, `refactor:`)

## Repository Structure
- Root: Repository documentation and quotes.json
- `/zoboomafoo/`: Terminal configuration files (.zshrc, .aliases, .env, .fun)
- `/serenity/`: Kitty terminal configuration
- `/aesthetics/`: UI theme documentation

## Best Practices
- Keep scripts focused on single responsibilities
- Use consistent error handling in shell functions
- Check for dependencies before executing commands
- Name functions descriptively and document their purpose