# Dotfiles

This repository contains my personal dotfiles managed with GNU Stow.

## Getting Started

Clone this repository:

```bash
git clone <repository-url> ~/dotfiles
cd ~/dotfiles
```

## Available Configurations

### Tmux

To set up tmux configuration:

```bash
cd ~/dotfiles
stow tmux
tmux source ~/.tmux.conf
```

This will create symlinks for the tmux configuration files and reload the configuration.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [tmux](https://github.com/tmux/tmux)

## License

MIT
