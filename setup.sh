#!/bin/bash


echo "Installing dependencies..."
sudo apt update -y && sudo apt upgrade -y

declare -a _packages=(
	git curl vim-gtk3
	python3 python3-pip
	neofetch build-essential
)

for i in "${_packages[@]}"; do
	sudo apt install -y "$i"
done

echo "Setting up dotfiles..."

DOTFILES_DIR="$HOME/.dotfiles"

# Backup existing .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  echo "Backed up existing .bashrc to .bashrc.bak"
fi

# Create a symlink
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

# Repeat for other files
ln -sf ~/.dotfiles/.xprofile ~/.xprofile

echo "Dotfiles setup complete!"

