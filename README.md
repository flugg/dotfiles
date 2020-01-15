Dotfiles for Mac using Brew, OhMyZsh, Antibody, Vim and more. Unlike a lot other dotfiles projects this has put a lot of thought into the user experience and safe usage. This will never replace your existing files and a fresh install will tell you exactly what's happening behind the scenes.

# Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)

# Requirements

These dotfiles assume you already have the following installed:

- MacOs
- Git
- Curl
- Zsh

# Installation

To get started, clone the project to your home directory:

```shell
git clone git@github.com:flugger/dotfiles.git ~/.dotfiles && export PATH=~/.dotfiles/bin:$PATH
```

This will clone this Git repository into `~/.dotfiles`. It will also add the Dotfiles' `bin` folder to the path giving you access to the `dot` command.

You may now install the Dotfiles using:

```shell
dot install
```

# Updating

```shell
dot update
```
