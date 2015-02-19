# git
alias g='git'

# the rest of the fun aliases
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr)%Creset %an: %s%Creset %C(yellow)%d%Creset' --abbrev-commit --date=relative"
