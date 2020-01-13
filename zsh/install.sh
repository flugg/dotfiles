# Zsh
message "Installing Oh My Zsh"
if [[ ! -d $ZSH ]]; then
  curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
else
  info "Already installed"
fi

message "Configuring Zsh"
if [[ ! -e $HOME/.zshrc ]]; then
  ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
else
  info "$HOME/.zshrc already exists"
fi

message "Installing Zsh plugins"
if [[ ! -e $HOME/.zsh_plugins.sh ]]; then
  info "Creating $HOME/.zsh_plugins.sh"
else
  info "Updating $HOME/.zsh_plugins.sh"
fi
antibody bundle <"$HOME/.zsh_plugins.txt" > $HOME/.zsh_plugins.sh
antibody update