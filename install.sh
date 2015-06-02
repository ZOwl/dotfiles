#!/bin/sh

sudo apt-get install vim awesome git-flow zsh rxvt-unicode-256color tmux

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

DOT_FILE_DIR="$(dirname "$0")"

ln -s $DOT_FILE_DIR/Xdefaults $HOME/.Xdefaults
ln -s $DOT_FILE_DIR/xinitrc $HOME/.xinitrc
ln -s $DOT_FILE_DIR/zshenv $HOME/.zshenv
ln -s $DOT_FILE_DIR/zprofile $HOME/.zprofile
ln -s $DOT_FILE_DIR/tmux.conf $HOME/.tmux.conf
ln -s $DOT_FILE_DIR/vimrc $HOME/.vimrc
ln -s $DOT_FILE_DIR/zpreztorc $HOME/.zpreztorc
ln -s $DOT_FILE_DIR/tskeleton $HOME/.tskeleton

ln -s ../$DOT_FILE_DIR/awesome $HOME/.config/
