# Prompt configuration
[ -s ~/.zshrc-prompt ] && . ~/.zshrc-prompt

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep limited number of lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if type dircolors > /dev/null; then
  eval "$(dircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 2000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

#setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
#setopt HIST_NO_STORE
# ref. man zshoptions

alias nohist="export HISTFILE=/dev/null"

setopt share_history

[ -f ~/.envvars ] && . ~/.envvars
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.zshrc-functions ] && . ~/.zshrc-functions
[ -f ~/.zshrc-peco ] && . ~/.zshrc-peco

# Execute 'ls' anytime after 'cd'
cd() { builtin cd "$@" && ls; }

# use "colordiff" if it exists
if type colordiff > /dev/null 2>&1; then alias diff=colordiff; fi

# Use "ccat" if it exists
# ref.
#   http://qiita.com/maeda1991/items/896f344921a6dab393d0
#   https://github.com/jingweno/ccat
if type ccat > /dev/null 2>&1; then alias cat=ccat; fi

# 'cd ..' with C-u
# ref. https://github.com/takeshik/configurations/commit/5a0b93462266c696a43cd4e32da5008987afb5cf#zsh/zshrc
# Silent style `cdup`
# cdup() { echo; cd ..; zle reset-prompt; }
# Explicit style `cdup`
cdup() { BUFFER="cd .."; zle accept-line; }
zle -N cdup
bindkey "^u" cdup

if [ -f $HOME/.cdd-source ]; then
  source $HOME/.cdd-source
  chpwd() { _cdd_chpwd }
fi

[ -f ~/.zshrc-local ] && . ~/.zshrc-local
[ -f ~/.aliases-local ] && . ~/.aliases-local

alias ismac='which sw_vers > /dev/null 2>&1'
! ismac && [ -f ~/.zshrc-warnings ] && . ~/.zshrc-warnings

if which nvim > /dev/null 2>&1; then
  alias vizshhistory="nvim -c 'e ++enc=utf-8' ~/.zsh_history"
else
  alias vizshhistory="vim -c 'e ++enc=utf-8' ~/.zsh_history"
fi
# if which busybox > /dev/null 2>&1; then
#   alias vizshhistory="busybox vi ~/.zsh_history"
# else
#   alias vizshhistory="vi -u /dev/null ~/.zsh_history"
# fi

if which code > /dev/null 2>&1; then
  alias codezshhistory="code ~/.zsh_history"
else
  alias codezshhistory="echo No VSCode"
fi

if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
  fpath=(${ASDF_DIR}/completions $fpath)
  #autoload -Uz compinit && compinit
  # Too much time to run this. Run `compinit` manually on using asdf.
fi

if [ -z $ANTIGEN_DISABLE ]; then
  # Antigen
  # Install by
  # curl -L git.io/antigen > ~/.antigen.zsh
  # ref. https://antigen.sharats.me/
  if [ -f $HOME/.antigen.zsh ] && sha256sum --quiet -c <(echo '3fc9472388232ecb7cf2c6d28f06109d857afa1c1897ce1bbeed40aced6e6518  '$HOME'/.antigen.zsh'); then
    source $HOME/.antigen.zsh
    # ref. https://github.com/zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-autosuggestions
    antigen apply
  fi
fi

# For profile
#if (which zprof > /dev/null 2>&1) ;then
#  zprof
#fi
#
# Add the following line to the beggining of .zshenv.
#zmodload zsh/zprof && zprof
#
# ref. https://qiita.com/vintersnow/items/7343b9bf60ea468a4180
