source $DOTFILES/functions.sh

# Vim
message "Configuring Vim"
if [[ ! -e $HOME/.vimrc ]]; then
  echo "Linking $HOME/.dotfiles/vim/.vimrc to $HOME/.vimrc"
  ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
else
  echo "$HOME/.vimrc already exists"
fi