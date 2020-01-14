message=$(tput bold)$(tput setaf 6)
success=`tput setaf 2`
info=`tput setaf 3`
reset=`tput sgr0`

echo "› ${message}Configuring Vim...${reset}"

if [[ ! -e $HOME/.vimrc ]]; then
  ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
  echo "${success}Linked ${HOME}/.dotfiles/vim/.vimrc to ${HOME}/vimrc.${reset}"
else
  echo "${info}${HOME}/.vimrc already exists.${reset}"
fi