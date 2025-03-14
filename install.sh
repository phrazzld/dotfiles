#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from the home directory to the dotfiles in this directory

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Dotfiles directory (assumes script is run from the dotfiles directory)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}Installing dotfiles from $DOTFILES_DIR${RESET}"

# Create symlinks for core configuration files
echo -e "${YELLOW}Creating symlinks for core dotfiles...${RESET}"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc" && echo -e "${GREEN}✓ .zshrc${RESET}" || echo -e "${RED}✗ .zshrc${RESET}"
ln -sf "$DOTFILES_DIR/.aliases" "$HOME/.aliases" && echo -e "${GREEN}✓ .aliases${RESET}" || echo -e "${RED}✗ .aliases${RESET}"
ln -sf "$DOTFILES_DIR/.env" "$HOME/.env" && echo -e "${GREEN}✓ .env${RESET}" || echo -e "${RED}✗ .env${RESET}"
ln -sf "$DOTFILES_DIR/.fun" "$HOME/.fun" && echo -e "${GREEN}✓ .fun${RESET}" || echo -e "${RED}✗ .fun${RESET}"

# Create backup of existing configurations if they exist
backup_if_exists() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    local backup="$1.bak.$(date +%Y%m%d%H%M%S)"
    echo -e "${YELLOW}Backing up $1 to $backup${RESET}"
    mv "$1" "$backup"
  fi
}

# Setup Claude Code custom slash commands directory
echo -e "${YELLOW}Setting up Claude Code custom slash commands...${RESET}"
# Backup existing claude commands if it's not a symlink
if [ -d "$HOME/.claude/commands" ] && [ ! -L "$HOME/.claude/commands" ]; then
  backup_dir="$HOME/.claude/commands.bak.$(date +%Y%m%d%H%M%S)"
  echo -e "${YELLOW}Backing up $HOME/.claude/commands to $backup_dir${RESET}"
  mv "$HOME/.claude/commands" "$backup_dir"
fi

# Ensure parent directory exists
mkdir -p "$HOME/.claude"
# Create symlink to the entire directory
ln -sf "$DOTFILES_DIR/claude-commands" "$HOME/.claude/commands" && echo -e "${GREEN}✓ Claude commands directory${RESET}" || echo -e "${RED}✗ Claude commands directory${RESET}"

# Reload shell
echo -e "${GREEN}Installation complete!${RESET}"
echo -e "${YELLOW}To apply changes immediately, run:${RESET}"
echo -e "${BLUE}zsh -c \"source ~/.zshrc\"${RESET}"