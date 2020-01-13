# Set the DOTFILES variable before calling this script to override the folder below
export DOTFILES=${DOTFILES:-$HOME/.dotfiles}

# Clone the dotfiles repository
git clone --branch "master" "https://github.com/flugger/dotfiles.git" "$DOTFILES" || {
    error "Git clone of flugger/dotfiles failed"
    exit 1
}

# Make the installation aliases available
source $DOTFILES/zsh/.dotfiles.zsh
