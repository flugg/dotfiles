# Path to dotfiles
export DOTFILES="$HOME/.dotfiles"

# Set default editors
export EDITOR="vim"
export VEDITOR="code"

# Configure Xdebug
export XDEBUG_CONFIG="idekey=VSCODE"

# Lazy load NVM to improve shell startup time
export NVM_LAZY_LOAD=true

# Move word backwards/forwards with option + left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# Move to start/end of line with cmd + left/right
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line