# Prompt configuration
[ -s ~/.zshrc-prompt ] && . ~/.zshrc-prompt

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if type dircolors > /dev/null
then
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
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

[ -f ~/.envvars ] && . ~/.envvars
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.aliases-local ] && . ~/.aliases-local
[ -f ~/.zshrc-functions ] && . ~/.zshrc-functions
[ -f ~/.zshrc-peco ] && . ~/.zshrc-peco

# Execute 'ls' anytime after 'cd'
cd() { builtin cd "$@" && ls; }

# use "colordiff" if it exists
if type colordiff > /dev/null 2>&1; then alias diff=colordiff; fi

# 'cd ..' with C-u
# ref. https://github.com/takeshik/configurations/commit/5a0b93462266c696a43cd4e32da5008987afb5cf#zsh/zshrc
cdup() { echo; cd ..; zle reset-prompt; }
zle -N cdup
bindkey "^u" cdup

if [ -f $HOME/.cdd-source ]
then
  source $HOME/.cdd-source
  chpwd() { _cdd_chpwd }
fi

[ -f $HOME/.zshrc-local ] && . ~/.zshrc-local

alias ismac='which sw_vers > /dev/null 2>&1'
! ismac && [ -f ~/.zshrc-warnings ] && . ~/.zshrc-warnings
