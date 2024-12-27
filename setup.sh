#!/bin/bash


echo "Installing dependencies..."
sudo apt update -y && sudo apt upgrade -y

sudo apt install -y \
     curl \
     git \
     tmux \
     vim \
     python3 \
     python3-pip \
     emacs \
     org-mode-doc \
     okular \
     syncthing \
     kdeconnect


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
ln -sf ~/.dotfiles/emacs/init.el ~/.emacs
ln -sf ~/.dotfiles/.xprofile ~/.xprofile

echo "Dotfiles setup complete!"


# setting up syncthing
echo "Setting up syncthing"

#!/bin/bash

# Start Syncthing in the background
nohup syncthing &>/dev/null &

# Enable Syncthing to start at boot
if command -v systemctl &>/dev/null; then
    systemctl --user enable syncthing.service
    systemctl --user start syncthing.service
else
    echo "Systemd not found. Ensure Syncthing starts manually or via rc.local."
fi

echo "Syncthing setup complete."
