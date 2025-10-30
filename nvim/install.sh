#!/bin/bash


# Error handling
set -euo pipefail
trap 'echo "[Error] An error occurred during script execution." >&2; exit 1' ERR

# Directory where this script is located
THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME/.config"

echo "[Info] Creating symlink at $TARGET."

# Create ~/.config directory if not exists
if [ ! -d "$HOME/.config" ]; then
  echo "[Info] Creating ~/.config directory."
  mkdir -p "$HOME/.config"
fi

# Create symlink (assuming nvim directory is in the same directory as this script)
ln -s "$THIS_DIR" "$TARGET/nvim"
echo "[Success] Symlink created: $TARGET/nvim -> $THIS_DIR"