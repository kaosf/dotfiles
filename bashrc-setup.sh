if [ -L $HOME/.bashrc ]; then
  exit 0
fi

if grep -q '__prompt_command' $HOME/.bashrc 2> /dev/null; then
  exit 0
fi

cat <<'EOS' >> $HOME/.bashrc
export PROMPT_COMMAND=__prompt_command
function __prompt_command() {
  local EXIT="$?"
  PS1='[\u@\h \W'
  if [ $EXIT != 0 ]; then PS1+=" $EXIT"; fi
  PS1+=']\$ '
}
export HISTCONTROL=ignorespace
alias nohist='export HISTFILE=/dev/null'
export PATH=$HOME/.bin:$PATH
mkdir -p $HOME/.bin
EOS
