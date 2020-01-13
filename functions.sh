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
