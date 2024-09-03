\#!/usr/bin/env sh
echo "link .zshrc"
ln -s ~/usr/dotfiles/zsh/.zshrc ~/
echo "link .zprofile"
ln -s ~/usr/dotfiles/zsh/.zprofile ~/

echo "Install starship"
curl -sS https://starship.rs/install.sh | sh
