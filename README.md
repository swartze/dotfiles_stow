# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure the following on your system:
* neovim
* sway, i3 and/or hyprland
* waybar
* NvChad
* bash
* tmux
* alacritty
* GNU stow

## installation

First, check out the dotfiles repo in to your $HOME directory

```

$ git clone git@github.com:swartze/dotfiles_stow.git
$ cd .dotfiles

```

then use GNU stow to create symlinks

```
$ stow .
```

process from https://www.youtube.com/watch?v=y6XCebnB9gs&t=136s
