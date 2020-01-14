# Path to Oh My Zsh configuration
export ZSH=$HOME/.oh-my-zsh

# Name of the theme to load
ZSH_THEME="robbyrussell"

# Source shell files
for file in $HOME/.dotfiles/zsh/.{dotfiles,exports,functions,path,config,aliases}.zsh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Load plugins using Antibody
source ~/.zsh_plugins.sh

# Bootstrap Oh My Zsh
source $ZSH/oh-my-zsh.sh