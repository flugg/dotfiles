message () {
  printf "› \e[1;36m%s\e[0m\n" "$1"
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
echo "All dependencies installed"

# General
message "Hides 'Last login' message"
if [[ ! -e $HOME/.hushlogin ]]; then
  echo "Creating $HOME/.hushlogin"
  touch $HOME/.hushlogin
else
  echo "$HOME/.hushlogin already exists"
fi

sh ${PWD}/git/install.sh
sh ${PWD}/git/macos.sh
sh ${PWD}/git/zsh.sh
sh ${PWD}/git/vim.sh
