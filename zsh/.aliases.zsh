# Miscellaneous
alias sudo='sudo ' # Allows sudo for all aliases
alias path='echo -e ${PATH//:/\\n}' # List all paths registered
alias copy="tr -d '\n' | pbcopy" # Removes the new-line added by pbcopy
alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app" # Starts screensaver
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew" # Fixes 'brew doctor' bug for Pyenv

# Information
alias ip='curl -s https://ipinfo.io/ip'
alias localip='ipconfig getifaddr en0'
alias speedtest='speedtest --simple'
alias week='date +%V'

# Directories
alias mkd="mkd(){ mkdir -p '$1'; cd '$1' }; mkd "
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias finder='ofd'

# Files
alias a='${EDITOR} $DOTFILES/zsh/.aliases'
alias zshrc='${EDITOR} $HOME/.zshrc'
alias vimrc='${EDITOR} $HOME/.vimrc'
alias brewfile='${EDITOR} $HOME/.brewfile'
alias sshconfig='${EDITOR} $HOME/.ssh/config'
alias hostfile='sudo ${EDITOR} /etc/hosts'

# SSH
alias pubkey='pbcopy < $HOME/.ssh/id_rsa.pub; echo "Public SSH key copied"'

# Git
alias nah='git reset --hard;git clean -df'

# JavaScript
alias jest='./node_modules/.bin/jest'

# PHP
alias php72='valet use php@7.2'
alias php73='valet use php@7.3'
alias php74='valet use php'
alias art='php artisan'
alias phpunit='./vendor/bin/phpunit'
alias pu='phpunit'