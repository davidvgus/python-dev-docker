
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color'

alias gh='git hist'
alias ga='git add'
alias gp='git push'
alias gl='git log --graph --oneline --all'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias tmls='tmux list-sessions'
alias tma='tmux a -t'
alias ssht='echo use_st'
alias st='ssh dave@thinkpad -X'
alias xr='xrefresh'
set -o vi
alias vim='vim -W ~/.vim-last-scriptout'
alias ack='ack -u'
alias t='todo.sh -t'
alias less='/bin/less -R'


alias ack='ack -u'
alias t='todo.sh -t'
alias info='info --vi-keys'
alias sls='sudo ls -la'
alias python=python3.5
alias ptpython='python3.5 -m ptpython'
#alias irssi='tmux irssi'

alias dls='docker container ls'
echo "Loaded .bash_aliases"

