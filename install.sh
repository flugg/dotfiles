message () {
  printf "› \e[1;36m%s\e[0m\n" "$1"
}

info () {
  echo $1
}

question () {
  printf "\e[1;29m%s\e[0m\n" "$1"
}

error () {
  printf "\e[1;31m%s\e[0m\n" "$1"
  exit
}

check_dependency () {
  if [[ $(command -v $1) == "" ]]; then
    error "Required dependency $1 is not installed"
  fi
}

# Check Dependencies
message "Checking dependencies"
check_dependency curl
check_dependency git
check_dependency zsh
info "All dependencies installed"

# General
message "Hides 'Last login' message"
if [[ ! -e $HOME/.hushlogin ]]; then
  info "Creating $HOME/.hushlogin"
  touch $HOME/.hushlogin
else
  info "$HOME/.hushlogin already exists"
fi

# Git
message "Configuring Git"
if [[ ! -e $HOME/.gitconfig ]]; then
  info "Linking $HOME/.dotfiles/git/.gitconfig to $HOME/.gitconfig"
  ln -s $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig

  info "Linking $HOME/.dotfiles/git/.gitignore to $HOME/.gitignore"
  ln -s $HOME/.dotfiles/git/.gitignore $HOME/.gitignore

  question 'What is your name?'
  read -r user_name
  question 'What is your email address?'
  read -r user_email

  git config --global user.name "$user_name"
  git config --global user.email "$user_email"
else
  info "$HOME/.gitconfig already exists"
fi

# Homebrew
message "Configuring Homebrew"
if [[ ! -e $HOME/Brewfile ]]; then
  info "Linking $HOME/.dotfiles/macos/Brewfile to $HOME/Brewfile"
else
  info "$HOME/Brewfile already exists"
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
