# CLAUDE.md - Dotfiles Repository Guide

## Commands
- `zsh -c "source ~/.zshrc"` - Reload shell configuration
- `./install.sh` - Install dotfiles by creating symlinks

## Code Style Guidelines
- **Shell**: Use POSIX-compatible syntax with `if [[ -n "$var" ]]; then` style conditionals
- **Error Handling**: Check file existence (`-f`), command availability, and use error messages
- **Functions**: Document with inline comments above each function
- **Configuration Files**: Use 2-space indentation for YAML and consistent structure
- **Git**: Use conventional commits (`feat:`, `fix:`, `docs:`, `style:`, `refactor:`)

## Repository Structure
- Root: Main configuration files (.zshrc, .aliases, .env, .fun) and repository documentation
- `/aesthetics/`: UI theme documentation
- `/zoboomafoo/`: Reference files from work environment (for reference only)
- `/serenity/`: Reference files from personal environment (for reference only)
- `/prompts/`: AI prompt templates

## Environment Detection
Files use hostname detection to load environment-specific configurations:
```bash
case "$(hostname)" in
  serenity) IS_SERENITY=1 ;;
  zoboomafoo) IS_ZOBOOMAFOO=1 ;;
esac
```

## Best Practices
- Keep scripts focused on single responsibilities
- Use consistent error handling in shell functions
- Check for dependencies before executing commands
- Name functions descriptively and document their purpose
- Use environment detection for machine-specific configurations
- Maintain a single source of truth for all configuration