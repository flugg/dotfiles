#!/bin/sh

echo "Setting up Mac..."

# Install Homebrew if it's not already installed.
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes.
echo "Updating Homebrew recipes..."
brew update

# Install Homebrew dependencies using Brewfile
echo "Installing Homebrew dependencies..."
brew bundle

# Symlink the .zshrc file from the .dotfiles to the home directory.
echo "Adding .zshrc file to the home directory..."
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
echo "Adding .mackup.cfg file to the home directory..."
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set MacOS settings and reload the shell.
source .macos