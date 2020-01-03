# Path to Oh My Zsh configuration
export ZSH=$HOME/.oh-my-zsh

# Name of the theme to load
ZSH_THEME="robbyrussell"

# List of plugins to load
plugins=(git zsh-autosuggestions zsh-nvm)

# Bootstrap Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Source shell files
for file in $HOME/.dotfiles/.{aliases,exports,functions,path}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Setup Pyenv for managing Python environments
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Fix Pyenv warnings for 'brew doctor'
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"