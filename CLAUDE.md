# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands
- `zsh -c "source ~/.zshrc"` - Reload shell configuration
- `./install.sh` - Install dotfiles by creating symlinks
- `shellcheck filename.sh` - Validate shell scripts

## Code Style Guidelines
- **Shell**: POSIX-compatible syntax with `if [[ -n "$var" ]]; then` style conditionals
- **Error Handling**: Check file existence (`-f`), command availability, and use descriptive error messages
- **Functions**: Document with inline comments and use descriptive names
- **Formatting**: 2-space indentation for YAML/JSON; consistent structure in config files
- **Git**: Use conventional commits (`feat:`, `fix:`, `docs:`, `style:`, `refactor:`)
- **Types**: Prefer strong typing when applicable (TypeScript strict mode)

## Repository Structure
- Root: Configuration files (.zshrc, .aliases, .env, .fun)
- `/aesthetics/`: UI theme documentation
- `/claude-commands/`: Custom Claude Code slash commands
- `/prompts/`: AI prompt templates

## Environment Detection
```bash
case "$(hostname)" in
  serenity) IS_SERENITY=1 ;;
  zoboomafoo) IS_ZOBOOMAFOO=1 ;;
esac
```

## Best Practices
- Use single responsibility principle for scripts
- Implement consistent error handling
- Check dependencies before command execution
- Maintain environment-specific configurations
- Follow TDD when writing new scripts
- Prioritize simplicity and readability over clever implementations