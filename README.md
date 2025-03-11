# Unified Dotfiles

A consolidated collection of ZSH configuration, environment variables, aliases, and shell functions that work across multiple systems.

## Overview

This repository contains unified dotfiles that work across both personal (serenity) and work (zoboomafoo) environments. The configuration adapts automatically based on the hostname or available tools.

## Features

- Unified `.zshrc` with environment-specific settings
- Shared `.aliases` with conditional loading based on environment
- Common `.env` file with environment variables
- Useful shell functions in `.fun`

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

This will create symbolic links from your home directory to the dotfiles in this repository.

## Environment Detection

The configuration automatically detects which environment it's running in using hostname checks:

```bash
case "$(hostname)" in
  serenity) IS_SERENITY=1 ;;
  zoboomafoo) IS_ZOBOOMAFOO=1 ;;
esac
```

Relevant configurations are then loaded conditionally.

## License

MIT
