source $DOTFILES/functions.sh

ZSH=${ZSH:-$HOME/.oh-my-zsh}

# Zsh
message "Installing Oh My Zsh"

if [[ ! -d $ZSH ]]; then
  curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
else
  echo "Already installed"
fi

message "Configuring Zsh"
if [[ ! -e $HOME/.zshrc ]]; then
  ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
else
  echo "$HOME/.zshrc already exists"
fi

message "Installing Zsh plugins"
if [[ ! -e $HOME/.zsh_plugins.sh ]]; then
  echo "Creating $HOME/.zsh_plugins.sh"
else
  echo "Updating $HOME/.zsh_plugins.sh"
fi
antibody bundle <"$HOME/.zsh_plugins.txt" > $HOME/.zsh_plugins.sh
antibody update