# Vim
message "Configuring Vim"
if [[ ! -e $HOME/.vimrc ]]; then
  echo "Linking $HOME/.dotfiles/vim/.vimrx to $HOME/.vimrc"
  ln -s $HOME/.dotfiles/vim/.vimrx $HOME/.vimrc
else
  echo "$HOME/.vimrc already exists"
fi