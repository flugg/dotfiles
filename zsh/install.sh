ZSH=${ZSH:-$HOME/.oh-my-zsh}

current_dir="$( cd "$( dirname "$0" )" && pwd )"
message=$(tput bold)$(tput setaf 6)
success=`tput setaf 2`
info=`tput setaf 3`
reset=`tput sgr0`

echo "› ${message}Installing Oh My Zsh...${reset}"
if [[ ! -d $ZSH ]]; then
  curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  rm $HOME/.zshrc
else
  echo "${info}Already installed.${reset}"
fi

echo "› ${message}Configuring Zsh...${reset}"
if [[ ! -e $HOME/.zshrc ]]; then
  ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
  echo "${success}Linked ${HOME}/.dotfiles/zsh/.zshrc to ${HOME}/.zshrc.${reset}"
else
  echo "${info}${HOME}/.zshrc already exists${reset}"
fi

echo "› ${message}Installing Zsh plugins...${reset}"
if [[ ! -e $HOME/.zsh_plugins.sh ]]; then
  echo "${success}Creating $HOME/.zsh_plugins.sh.${reset}"
else
  echo "${success}Updating $HOME/.zsh_plugins.sh.${reset}"
fi
antibody bundle <"${current_dir}/plugins.txt" > $HOME/.zsh_plugins.sh
antibody update

source $HOME/.zshrc
