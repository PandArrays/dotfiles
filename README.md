# Dotfiles

This repository contains my personal dotfiles managed with GNU Stow.

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

This will :
- Check if GNU Stow is installed
- Set up all dotfiles configurations
- Source the tmux configuration if tmux is running

## Manual Configuration

If you prefer to set up configurations individually:

### Tmux

To set up tmux configuration:

```bash
cd ~/dotfiles
stow tmux
tmux source ~/.tmux.conf
```

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [tmux](https://github.com/tmux/tmux)

## License

MIT
