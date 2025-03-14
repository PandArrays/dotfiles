# Dotfiles

This repository contains my personal dotfiles managed with GNU Stow.

## Table of Contents

- [Dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
  - [Automatic Setup](#automatic-setup)
  - [Manual Configuration](#manual-configuration)
    - [Tmux](#tmux)
  - [Available Configurations](#available-configurations)
  - [Troubleshooting](#troubleshooting)
    - [TPM Issues](#tpm-issues)
    - [Catppuccin Theme Issues](#catppuccin-theme-issues)
  - [Requirements](#requirements)
  - [License](#license)

## Getting Started

Clone this repository:

```bash
git clone https://github.com/PandArrays/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## Automatic Setup

The easiest way to set up all configurations is to use the provided setup script:

```bash
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

This will:
- Check if GNU Stow is installed
- Create necessary directories (~/.tmux/plugins, ~/.config/tmux)
- Install TPM (Tmux Plugin Manager) if needed
- Install Catppuccin theme for tmux if needed
- Set up all dotfiles configurations
- Source the tmux configuration if tmux is running

## Manual Configuration

If you prefer to set up configurations individually:

### Tmux

To set up tmux configuration:

```bash
# Create necessary directories
mkdir -p ~/.tmux/plugins
mkdir -p ~/.config/tmux/plugins/catppuccin

# First, install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Next, install the Catppuccin theme
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# Then apply the configuration
cd ~/dotfiles
stow tmux
tmux source ~/.tmux.conf

# Finally, install the plugins by pressing prefix + I (capital I) in a tmux session
```

## Available Configurations

Currently, this dotfiles repository includes:

- **tmux**: Terminal multiplexer configuration with Catppuccin theme

## Troubleshooting

### TPM Issues

If you encounter issues with TPM:

1. Make sure tmux is running when you try to install plugins
2. Try cleaning TPM plugins: `~/.tmux/plugins/tpm/bin/clean_plugins`
3. Manually install plugins: `~/.tmux/plugins/tpm/bin/install_plugins`
4. Check plugin compatibility with your tmux version

### Catppuccin Theme Issues

For tmux versions prior to 3.2, refer to the [Catppuccin documentation](https://github.com/catppuccin/tmux#for-tmux-versions-prior-to-32) for alternative installation methods.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [tmux](https://github.com/tmux/tmux) (version 3.2+ recommended for full theme support)
- A [Nerd Font](https://www.nerdfonts.com) for proper icon display

## License

MIT
