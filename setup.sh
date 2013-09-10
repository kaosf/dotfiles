#! /bin/sh

ln -s $PWD/.zshrc     $HOME/.zshrc
ln -s $PWD/.vimrc     $HOME/.vimrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
if [ ! -d $HOME/.emacs.d ]
then
  mkdir $HOME/.emacs.d
fi
ln -s $PWD/.emacs.d_init.el $HOME/.emacs.d/init.el
