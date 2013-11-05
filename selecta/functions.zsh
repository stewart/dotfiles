# A bunch of functions for https://github.com/garybernhard/selecta

# Tmux-Selecta-Attach
# Quickly find and attach to an open tmux session
function tsa() {
  tmux attach -t `tmux ls | sort | selecta | cut -f1 -d:`
}

# Vim-Find
# Quickly find and open a file in vim
function vif() {
  vim `find * -type f -or -type l -maxdepth 15 | sort -u | selecta`
}

# Kill-Process
# Find and kill a process
function kps() {
  kill `ps aux | selecta | awk '{print $2 }'`
}

# Git-Selecta-Branch
# Checkout a branch
function gsb() {
  git branch --all --remotes | cut -c 3- | rev | cut -d "/" -f 1 | rev | selecta | xargs git checkout
}
