message=$(tput bold)$(tput setaf 6)
success=`tput setaf 2`
info=`tput setaf 3`
reset=`tput sgr0`

echo "› ${message}Configuring Homebrew...${reset}"
if [[ ! -e $HOME/Brewfile ]]; then
  ln -s $HOME/.dotfiles/brew/Brewfile $HOME/Brewfile
  echo "${success}Linked ${HOME}/.dotfiles/brew/Brewfile to ${HOME}/Brewfile.${reset}"
else
  echo "${info}${HOME}/Brewfile already exists.${reset}"
fi

if [[ $(command -v brew) == "" ]]; then
  echo "› ${message}Installing Homebrew...${reset}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "${success}Homebrew successfully installed.${reset}"
else
  echo "› ${message}Updating Homebrew recipes...${reset}"
  brew update
fi

echo "› ${message}Installing Homebrew packages...${reset}"
(cd $HOME && brew bundle)
