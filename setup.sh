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

# Backup existing dotfiles if they exist
if [ -f "$HOME/.bashrc" ]; then
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
  echo "Backed up existing .bashrc to .bashrc.bak"
fi

if [ -f "$HOME/.vimrc" ]; then
  mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
  echo "Backed up existing .vimrc to .vimrc.bak"
fi

if [ -f "$HOME/.xprofile" ]; then
  mv "$HOME/.xprofile" "$HOME/.xprofile.bak"
  echo "Backed up existing .bashrc to .xprofile.bak"
fi

if [ -f "$HOME/.gitconfig" ]; then
  mv "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
  echo "Backed up existing .gitconfig to .gitconfig.bak"
fi

# Create a symlinks
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/.xprofile" "$HOME/.xprofile"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# Setting up directories
mkdir "$HOME/Projects"

# Installing uzbek keyboard layout
KBD_PATH="/tmp/uzbek-linux-keyboard"
git clone https://github.com/itsbilolbek/uzbek-linux-keyboard.git $KBD_PATH
sudo $KBD_PATH/install.sh


echo "Dotfiles setup complete!"

