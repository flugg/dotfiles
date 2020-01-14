message=$(tput bold)$(tput setaf 6)
success=`tput setaf 2`
info=`tput setaf 3`
reset=`tput sgr0`

echo "› ${message}Configuring Homebrew...${reset}"
if [[ ! -e $HOME/.brewfile ]]; then
  ln -s $HOME/.dotfiles/brew/.brewfile $HOME/.brewfile
  echo "${success}Linked ${HOME}/.dotfiles/brew/.brewfile to ${HOME}/.brewfile.${reset}"
else
  echo "${info}${HOME}/.brewfile already exists.${reset}"
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
brew bundle --global --no-lock --file=.brewfile
