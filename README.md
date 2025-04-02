# dotfiles

A comprehensive dotfiles repository with adaptive configurations, AI prompt templates, and productivity tools that seamlessly work across multiple environments.

## Overview

This repository contains a unified configuration system that intelligently adapts between personal (serenity) and work (zoboomafoo) environments through hostname detection. It serves as a single source of truth for shell configuration, AI prompts, and development workflows.

## Features

- **Environment-Aware Configuration**
  - Unified `.zshrc` with dynamic environment detection
  - Conditional `.aliases` that load appropriate commands per environment
  - Shared `.env` file with common environment variables
  - Utility functions in `.fun` for daily development tasks

- **AI Tools & Templates**
  - Claude Code custom slash commands for structured development workflows
  - Curated collection of prompt templates for various AI assistants
  - UI/UX aesthetic reference files for design consistency

- **Best Practices**
  - Documented coding standards and shell scripting patterns
  - Conventional commit formatting and structured git workflows
  - Consistent style guides across configuration files

## Installation

Clone this repository to your development directory:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/Development/dotfiles
```

Install configuration files and commands:

```bash
cd ~/Development/dotfiles
./install.sh
```

This creates symbolic links from your home directory to the dotfiles and sets up Claude Code slash commands.

## Repository Structure

- **Root**: Main configuration files (`.zshrc`, `.aliases`, `.env`, `.fun`) and documentation
- **`/claude-commands/`**: Structured workflow commands for Claude Code CLI
- **`/prompts/`**: Templates for ChatGPT, Claude, and other AI assistants
- **`/aesthetics/`**: UI theme and design pattern documentation
- **`/zoboomafoo/` & `/serenity/`**: Environment-specific reference files

## Claude Code Commands

The repository includes a suite of slash commands for Claude Code that enable structured software development workflows:

- `/architect` - Generate technical plans for features or problems
- `/audit` - Create security audit documentation for codebases
- `/consult` - Document problems and request architectural assistance
- `/debug` - Structured approach to diagnosing and fixing bugs
- `/execute` - Implement tasks from TODO lists with best practices
- `/plan` - Create detailed technical plans for backlog items
- `/prime` - Gather context from key repository files
- `/push` - Quality assurance steps before committing code
- `/refactor` - Create structured plans for improving code quality
- `/review` - Establish code review processes and documentation
- `/ticket` - Convert plans into prioritized task tickets

## Environment Detection

Configuration files adapt to different environments using hostname detection:

```bash
case "$(hostname)" in
  serenity) IS_SERENITY=1 ;;
  zoboomafoo) IS_ZOBOOMAFOO=1 ;;
esac
```

## License

MIT
