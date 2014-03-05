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

# ref.
#   http://kitak.hatenablog.jp/entry/2013/05/25/103059
#   http://mollifier.hatenablog.com/entry/20100906/p1
#   http://liosk.blog103.fc2.com/blog-entry-209.html
#   `man zshcontrib` # for vcs_infor
#   `man zshmics` # for other zsh features
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="$ "
RPROMPT="%1(v|%F{green}%1v%f|) %F{green}%~%f"

alias rm='rm -i'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias v='vim'
alias view='vim -R'
alias e='emacs -nw'
export SVN_EDITOR=vim
export EDITOR=vim
export BROWSER=firefox

# execute 'ls' anytime after 'cd'
function cd() { builtin cd $@ && ls; }

# use "colordiff" if it exists
type colordiff > /dev/null
if [ $? -eq 0 ]
then
  alias diff=colordiff
fi

alias date-yymmddhhmmss='date +%Y%m%d%H%M%S'
alias df='df -Th'
alias google='w3m www.google.co.jp'

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
alias gpomgh='git push origin master && git push origin master:gh-pages'
alias gpl='git pull'
alias grfh='git reset FETCH_HEAD --hard'
alias grfhh=grfh
alias grhh='git reset HEAD --hard'
alias grh1h='git reset HEAD^ --hard'
alias gs='git status -sb'
alias gst='git status -sb'
alias gphm='git push heroku master'

# 'cd ..' with C-^
# ref. https://github.com/takeshik/configurations/commit/5a0b93462266c696a43cd4e32da5008987afb5cf#zsh/zshrc
function cdup() { echo; cd ..; zle reset-prompt; }
zle -N cdup
bindkey "^\^" cdup

alias ta='tig --all'
