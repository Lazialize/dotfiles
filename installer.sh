#!/usr/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [...options]" 0>&2
  command echo ""
  command echo "[Options]"
  command echo "--help, -h: Shows this message"
  command echo ""
}

check_os() {
  if [ "$(uname)" == "Darwin" ]; then
    OS="Mac"
  else
    command echo "Cannot recognize your operating system."
    command echo "So, dotfiles installing process is terminated."
    command echo ""
    exit 1
  fi
}

install_brew() {
  command echo "Install homebrew process started."
  
  if [[ "$(command -v brew)" == "" ]]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    export PATH=$PATH:/opt/homebrew/bin

    command echo "$(brew -v) installed!"
  else
    command echo "The homebrew is already installed. So, the process is skipped."
  fi
}

while [ $# -gt 0 ]
do
  case ${1} in
    --help|-h)
      helpmsg
      exit 0
      ;;
    *)
      ;;
  esac
  shift
done

check_os
command echo "Your operation system is recognized: ${OS}"

if [[ $OS == 'Mac' ]]; then
  install_brew
else
  exit 0
fi
