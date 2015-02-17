# Prompt configuration
[ -s ~/.zshrc-prompt ] && . ~/.zshrc-prompt

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
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

[ -f ~/.aliases ] && . ~/.aliases

export SVN_EDITOR=vim
export EDITOR=vim

# Execute 'ls' anytime after 'cd'
cd() { builtin cd "$@" && ls; }

# 'cd ..' with C-u
# ref. https://github.com/takeshik/configurations/commit/5a0b93462266c696a43cd4e32da5008987afb5cf#zsh/zshrc
cdup() { echo; cd ..; zle reset-prompt; }
zle -N cdup
bindkey "^u" cdup

# 'hub' subcommand completion
# ref.
#   http://blog.glidenote.com/blog/2012/05/03/zsh-completion/
#   http://gihyo.jp/dev/serial/01/zsh-book/0005
#   http://gihyo.jp/dev/serial/01/zsh-book
_hub () {
  local -a cmds
  if ((CURRENT == 2)); then
    # 'repositories' is for https://github.com/kaosf/hub-repositories
    cmds=( \
      'init'         \
      'add'          \
      'rm'           \
      'mv'           \
      'status'       \
      'commit'       \
      'log'          \
      'diff'         \
      'show'         \
      'branch'       \
      'checkout'     \
      'merge'        \
      'tag'          \
      'clone'        \
      'fetch'        \
      'pull'         \
      'push'         \
      'remote'       \
      'reset'        \
      'rebase'       \
      'bisect'       \
      'grep'         \
      'pull-request' \
      'fork'         \
      'create'       \
      'browse'       \
      'compare'      \
      'repositories' \
    )
    _describe -t commands "subcommand" cmds
  fi
  return 1;
}
compdef _hub hub

_bb () {
  local -a cmds
  if ((CURRENT == 2)); then
    # 'browse', 'download-archive', 'fork', 'group-privilege' and 'services'
    # are for https://bitbucket.org/kaosf/bitbucket-cli-sub-commands
    cmds=( \
      'create'            \
      'update'            \
      'delete'            \
      'clone'             \
      'create_from_local' \
      'pull'              \
      'download'          \
      'list'              \
      'privilege'         \
      'browse'            \
      'deploy-keys'       \
      'download-archive'  \
      'fork'              \
      'group-privilege'   \
      'services'          \
    )
    _describe -t commands "subcommand" cmds
  fi
  return 1;
}
compdef _bb bb

peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr

bindkey '^@' peco-cdr

if [ -f $HOME/.cdd-source ]
then
  source $HOME/.cdd-source
  chpwd() { _cdd_chpwd }
fi

if [ -f $HOME/.zshrc-local ]
then
  source $HOME/.zshrc-local
fi

ismac () {
  which sw_vers > /dev/null 2>&1
}

if ! ismac && [ -f $HOME/.zshrc-warnings ]
then
  source $HOME/.zshrc-warnings
fi

alias disablescreensaver='xset s off'

randstr () {
  local length=$1
  if [ $# -lt 1 ]
  then
    length=40
  fi
  echo `tr -dc A-Za-z0-9 < /dev/urandom | head -c $length`
}
