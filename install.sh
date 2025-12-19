#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
# Treat unset variables as an error.
# The return value of a pipeline is the status of the last command to exit with a non-zero status.
set -euo pipefail

# Find the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to create a symbolic link
# $1: source, $2: destination
create_symlink() {
  local source="$1"
  local destination="$2"

  # Create parent directory if it doesn't exist
  mkdir -p "$(dirname "$destination")"

  # Create a forced symbolic link
  ln -snf "$source" "$destination"
  echo "Created symlink: $destination -> $source"
}

# ---------------------------------------------
# Main Installation
# ---------------------------------------------

echo "Starting dotfiles setup..."

# Create ~/.config directory if it doesn't exist
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

# --- OS-specific setup ---
if [[ "$(uname)" == "Darwin" ]]; then
  echo "macOS detected. Setting up Mac-specific configurations..."
  create_symlink "$DOTFILES_DIR/aerospace" "$HOME/.config/aerospace"
  create_symlink "$DOTFILES_DIR/borders" "$HOME/.config/borders"
  create_symlink "$DOTFILES_DIR/sketchybar" "$HOME/.config/sketchybar"
  create_symlink "$DOTFILES_DIR/karabiner" "$HOME/.config/karabiner"
fi

# --- Common setup ---
echo "Setting up common configurations..."

# Git
create_symlink "$DOTFILES_DIR/git" "$HOME/.config/git"
git config --global core.excludesfile "$HOME/.config/git/global"
echo "Git configuration linked and set."

# Zsh & Starship
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
create_symlink "$DOTFILES_DIR/zsh/starship.toml" "$HOME/.config/starship.toml"
if ! command -v starship &>/dev/null; then
  echo "Installing Starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
else
  echo "Starship is already installed."
fi

# Neovim
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# WezTerm
# The configuration can be a single file or a directory.
# Let's link the whole directory to allow for local overrides or modules.
create_symlink "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
# For compatibility, also link the main file directly if ~/.wezterm.lua is expected.

# Tmux
create_symlink "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"
create_symlink "$DOTFILES_DIR/tmux/tmux-session-manager" "$HOME/.local/bin/tmux-session-manager"

# fzf (Fuzzy Finder)
if [ ! -d "$HOME/.fzf" ]; then
  echo "Installing fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  "$HOME/.fzf/install" --all # --all installs for all shells without prompts
else
  echo "fzf is already installed."
fi
