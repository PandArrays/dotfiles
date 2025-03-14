#!/bin/bash

# Dotfiles setup script
# This script sets up all dotfiles configurations using GNU Stow

set -e  # Exit on error

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$BASE_DIR"

echo "Setting up dotfiles from: $BASE_DIR"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "GNU Stow is required but not installed. Please install it first."
    echo "  macOS: brew install stow"
    echo "  Ubuntu/Debian: sudo apt install stow"
    echo "  Fedora: sudo dnf install stow"
    echo "  Arch Linux: sudo pacman -S stow"
    exit 1
fi

# Install TPM (Tmux Plugin Manager) if not already installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "TPM installed successfully!"
else
    echo "TPM is already installed."
fi

# Install Catppuccin theme for tmux if not already installed
if [ ! -d "$HOME/.config/tmux/plugins/catppuccin/tmux" ]; then
    echo "Installing Catppuccin theme for tmux..."
    mkdir -p ~/.config/tmux/plugins/catppuccin
    git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
    echo "Catppuccin theme installed successfully!"
else
    echo "Catppuccin theme is already installed."
fi

# Function to stow a package
stow_package() {
    local package=$1
    echo "Setting up $package configuration..."
    stow -R "$package"
}

# List of packages to stow
# Add more packages here as your dotfiles grow
PACKAGES=(
    "tmux"
)

# Stow each package
for package in "${PACKAGES[@]}"; do
    stow_package "$package"
done

# Source specific configurations that need it
echo "Sourcing tmux configuration..."
if command -v tmux &> /dev/null && [ -n "$TMUX" ]; then
    tmux source ~/.tmux.conf
    echo "Remember to press prefix + I to install tmux plugins"
else
    echo "NOTE: tmux is not running. Configuration will be applied next time you start tmux."
fi

echo "Dotfiles setup complete! ✅"
echo "Note: If you're using tmux, remember to press prefix + I (capital i) to install the plugins."
