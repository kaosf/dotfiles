if [ -L $HOME/.bashrc ]; then
  exit 0
fi

if cat $HOME/.bashrc | grep 'export PROMPT_COMMAND=__prompt_command'; then
  exit 0
fi

cat <<EOS >> $HOME/.bashrc
export PROMPT_COMMAND=__prompt_command
function __prompt_command() {
  local EXIT="\$?"
  PS1='[\\u@\\h \\W'
  if [ \$EXIT != 0 ]; then PS1+=" \$EXIT"; fi
  PS1+=']\\\$ '
}
EOS
