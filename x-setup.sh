#! /bin/sh

ln -s $PWD/.xmodmap                 $HOME/.xmodmap
ln -s $PWD/.xmodmap-for-hhkb        $HOME/.xmodmap-for-hhkb
ln -s $PWD/.xmodmap-for-hhkb-revert $HOME/.xmodmap-for-hhkb-revert

if [ -d $HOME/local/bin ]
then
  echo 'xmodmap .xmodmap-for-hhkb' \
    > $HOME/local/bin/hhkb-start
  chmod +x $HOME/local/bin/hhkb-start
  echo 'xmodmap .xmodmap-for-hhkb-revert' \
    > $HOME/local/bin/hhkb-finish
  chmod +x $HOME/local/bin/hhkb-finish
fi
