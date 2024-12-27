# Install essential packages
sudo apt update && sudo apt install -y git vim emacs

# Clone the dotfiles repo
git clone https://github.com/itsbilolbek/dotfiles.git $HOME/.dotfiles

# Run the setup script
bash $HOME/.dotfiles/setup.sh
