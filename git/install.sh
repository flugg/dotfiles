# Git
message "Configuring Git"
if [[ ! -e $HOME/.gitconfig ]]; then
  echo "Linking $HOME/.dotfiles/git/.gitconfig to $HOME/.gitconfig"
  ln -s $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

  echo "Linking $HOME/.dotfiles/git/.gitignore to $HOME/.gitignore"
  ln -s $HOME/.dotfiles/git/.gitignore $HOME/.gitignore

  question 'What is your name?'
  read -r user_name
  question 'What is your email address?'
  read -r user_email

  git config --global user.name "$user_name"
  git config --global user.email "$user_email"
else
  echo "$HOME/.gitconfig already exists"
fi