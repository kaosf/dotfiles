# Set up the prompt

autoload -Uz promptinit
promptinit
prompt walters

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
eval "$(dircolors -b)"
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


## Configure manually by ka

alias rm='rm -i'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias v='vim'
alias e='emacs -nw'
export SVN_EDITOR=vim
# export EDITOR=vim

# execute 'ls' anytime after 'cd'
function cd() { builtin cd $@ && ls; }

alias be='bundle exec'

alias g='git'
alias gad='git add'
alias gadd='git add'
alias gbr='git branch'
alias gci='git commit'
alias gco='git checkout'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias glg="git log --stat --pretty=format:'%Cblue%h %Cgreen%ai %Cred%an %d
%Creset%s'"
alias glggo='git log --graph --oneline'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gs='git status'
alias gst='git status'
alias gphm='git push heroku master'

# 'cd ..' with C-^
# ref. https://github.com/takeshik/configurations/commit/5a0b93462266c696a43cd4e32da5008987afb5cf#zsh/zshrc
function cdup() { echo; cd ..; zle reset-prompt; }
zle -N cdup
bindkey "^\^" cdup

alias ta='tig --all'
