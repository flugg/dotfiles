source $DOTFILES/functions.sh

# Homebrew
message "Configuring Homebrew"
if [[ ! -e $HOME/Brewfile ]]; then
  echo "Linking $HOME/.dotfiles/mac/Brewfile to $HOME/Brewfile"
  ln -s $HOME/.dotfiles/mac/Brewfile $HOME/Brewfile
else
  echo "$HOME/Brewfile already exists"
fi

if [[ $(command -v brew) == "" ]]; then
  message "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  message "Updating Homebrew recipes"
  brew update
fi

message "Installing Homebrew packages"
(cd $HOME && brew bundle)