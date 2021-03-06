# --------------------------
# bash
# --------------------------
alias bios='sudo systemctl reboot --firmware-setup'
alias dist='cat /etc/lsb-release'
alias bash='source ~/.bashrc'

# --------------------------
# General
# --------------------------

alias path='echo $PATH | sed -e "s/:/\n/g"'
alias ..='cd ..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias df='df -h'
alias less='less -NM'


# --------------------------
# vim
# --------------------------

alias vi='vim -u ~/.vim_runtime/vimrcs/minimal.vim'

# --------------------------
# git
# --------------------------
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit --amend --no-edit'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gt='git tree'
alias gri='git rm -r --cached .; git add .; git commit -m ".gitignore is now working" '
alias gls='git log --stat'
alias glo='git log --oneline'
alias glp='git log -p'
alias glog="git log --date=short --pretty=format:'%Cgreen%h %cd %Cblue%cn%x09%Creset%s' | tail -1 && echo '' && git status -s -b"



# --------------------------
# ssh
# --------------------------

alias ssh="cat ~/.ssh/conf.d/* > ~/.ssh/config; ssh"
alias scp="cat ~/.ssh/conf.d/* > ~/.ssh/config; scp"
#alias git="cat ~/.ssh/conf.d/* > ~/.ssh/config; git"

# --------------------------
# Docker
# --------------------------
dstop() { docker stop $(docker ps -a -q); }
drm() { docker rm -f $(docker ps -aq); }
drmi() { docker rmi -f $(docker images -aq); }
dup() { docker-compose up -d;  }
dupr() { docker-compose up -d --build; }
ddown() { docker-compose down; }

alias dl="docker ps -l -q"


# --------------------------
# python
# --------------------------

#alias p='python3'
#alias python='python3'
#alias pip='pip3'

# --------------------------
# C/C++
# --------------------------

alias m='make'
alias gccw='gcc -Wall -Werror -Wextra'
alias cl='clang++ -Wall -Werror -Wextra'
alias leaks='valgrind --leak-check=full'

# --------------------------
# Utils
# --------------------------

alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias keygen='ssh-keygen -t rsa -b 4096 -C "programmer2844@gmail.com"'

# --------------------------
# 42
# --------------------------

alias norm='~/.norminette/norminette.rb'
