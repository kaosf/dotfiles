cat <<'EOS' >> ~/.bashrc
export HISTCONTROL=ignorespace
alias nohist='export HISTFILE=/dev/null'
export PROMPT_COMMAND=__prompt_command
function __prompt_command() {
  local EXIT="$?"
  PS1='[\u@\h \W'
  if [ $EXIT != 0 ]; then PS1+=" $EXIT"; fi
  PS1+=']\$ '
}
EOS

cat <<'EOS' >> ~/.bashrc
export HISTCONTROL=ignorespace
alias nohist='export HISTFILE=/dev/null'
export PROMPT_COMMAND=__prompt_command
function __prompt_command() {
  local EXIT="$?"
  PS1='\u@\h:\W# '
  if [ $EXIT != 0 ]; then PS1+="[$EXIT] "; fi
}
EOS

ln -sf $PWD/tiny/.vimrc $HOME/.vimrc
