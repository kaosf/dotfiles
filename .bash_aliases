alias rm='rm -i'

alias v=vim
alias view='vim -R'
alias e=emacs

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
alias gdf='git diff --color'
alias gdfc='git diff --cached --color'
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

alias ta='tig --all'

alias suvi='sudo -H vi'
alias suv=suvi
