message=$(tput bold)$(tput setaf 6)
question=`tput bold`
success=`tput setaf 2`
info=`tput setaf 3`
reset=`tput sgr0`

echo "› ${message}Configuring macOS...${reset}"

source $DOTFILES/mac/.macos