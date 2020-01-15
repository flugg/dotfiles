message=$(tput bold)$(tput setaf 6)
question=`tput bold`
success=`tput setaf 2`
info=`tput setaf 3`
reset=`tput sgr0`

echo "› ${message}Configuring Git...${reset}"
if [[ ! -e $HOME/.gitconfig ]]; then
  ln -s $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
  echo "${success}Linked ${HOME}/.dotfiles/git/.gitconfig to ${HOME}/gitconfig.${reset}"

  ln -s $HOME/.dotfiles/git/.gitignore $HOME/.gitignore
  echo "${success}Linked ${HOME}/.dotfiles/git/.gitignore to ${HOME}/gitignore.${reset}"

  echo "${question}What is your name?${reset}"
  read -r user_name
  echo "${question}What is your email address?${reset}"
  read -r user_email

  git config --global user.name "${user_name}"
  git config --global user.email "${user_email}"
  echo "${success}Updated ${HOME}/.gitconfig with name and email address.${reset}"
else
  echo "${info}$HOME/.gitconfig already exists.${reset}"
fi