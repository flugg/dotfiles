export DOTFILES="$( cd "$( dirname "$0" )" && pwd )"

source $DOTFILES/functions.sh

# Check Dependencies
message "Checking dependencies"
check_dependency curl
check_dependency git
check_dependency zsh
echo "All dependencies installed"

# General
message "Hides 'Last login' message"
if [[ ! -e $HOME/.hushlogin ]]; then
  echo "Creating $HOME/.hushlogin"
  touch $HOME/.hushlogin
else
  echo "$HOME/.hushlogin already exists"
fi

# Source other installation files
source ${DOTFILES}/git/install.sh
source ${DOTFILES}/mac/install.sh
source ${DOTFILES}/zsh/install.sh
source ${DOTFILES}/vim/install.sh
