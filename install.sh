#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

REPO_DIR="$( cd "$( dirname "$0" )" && pwd )"

#TODO Symlinks Setup Here
function linkFile() {
    ln -fns ${REPO_DIR}/$1 "${HOME}/.$1";
}

linkFile "vimrc"
linkFile "zprofile"
linkFile "zshrc"
linkFile "i3"
linkFile "tmux.conf"

PACKAGES="curl build-essential cmake python-dev python3-dev ctags golang \
python-setuptools python3-setuptools python-pip python3-pip flake8"

apt-get update
apt-get install ${PACKAGES} -y

VIMPLUG_CURL_ARGS="--create-dirs -f -L -o"
VIMPLUG_DEST="${HOME}/.vim/autoload/plug.vim"
VIMPLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"


#if [type curl 1>/dev/null eq 1]; then
#    echo >&2 "curl is required but not installed. Aborting.";
#    exit 1;
#fi

# install vim plug
if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then
    echo "Installing vim-plug"
    curl $VIMPLUG_CURL_ARGS $VIMPLUG_DEST $VIMPLUG_URL
fi

# install the vim pluggins
# TODO check for vim version
vim +PlugClean! +PlugInstall +qall

# special configuration needed for ycm
( cd $HOME/.vim/plugged/YouCompleteMe && python3 install.py --clang-completer --go-completer)
vim +YcmRestartServer +qall

# install pipenv
#python3 -m pip install --user "pipenv"

# black
#python3 -m pip install --user "black"
