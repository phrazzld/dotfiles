# Unified Dotfiles

A consolidated collection of ZSH configuration, environment variables, aliases, and shell functions that work across multiple systems.

## Overview

This repository contains unified dotfiles that work across both personal (serenity) and work (zoboomafoo) environments. The configuration adapts automatically based on the hostname or available tools.

## Features

- Unified `.zshrc` with environment-specific settings
- Shared `.aliases` with conditional loading based on environment
- Common `.env` file with environment variables
- Useful shell functions in `.fun`
- Claude Code custom slash commands in `claude-commands/`

## Installation

Clone this repository to your home directory:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/Development/dotfiles
```

Install by running:

```bash
cd ~/Development/dotfiles
./install.sh
```

This will create symbolic links from your home directory to the dotfiles in this repository and set up Claude Code custom slash commands.

## Environment Detection

The configuration automatically detects which environment it's running in using hostname checks:

```bash
case "$(hostname)" in
  serenity) IS_SERENITY=1 ;;
  zoboomafoo) IS_ZOBOOMAFOO=1 ;;
esac
```

Relevant configurations are then loaded conditionally.

## Claude Code Commands

Custom slash commands for Claude Code CLI are stored in the `claude-commands/` directory. These are automatically symlinked to `~/.claude/commands/` during installation. 

Available commands:
- `/clear-todos` - Execute tasks from a TODO list with structured implementation
- `/fix-the-bug` - Systematic approach to bug diagnosis and fixing
- `/ticket-the-plan` - Convert a plan document into structured, prioritized tasks

## License

MIT
