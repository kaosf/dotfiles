# Load the original .bashrc
if [ -f $HOME/.bashrc.orig ]; then
  . $HOME/.bashrc.orig
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# My customized prompt string (PS1)
# Show the last exit code
# ref. http://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
if [ -f $HOME/.bashrc-prompt ]; then
  . $HOME/.bashrc-prompt
fi
if [ -f $HOME/.bashrc-prompt-debian ]; then
  . $HOME/.bashrc-prompt-debian
fi
