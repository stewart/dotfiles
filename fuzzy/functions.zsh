# A bunch of functions for https://github.com/jhawthorn/fzy

# tmux-select-attach
# Quickly find and attach to an open tmux session
function tsa() {
  tmux attach -t `tmux ls | sort | cut -f1 -d: | rff`
}

# Vim-Find
# Quickly find and open a file in vim
function v() {
  vim `fd --type f $@ | rff`
}

# Kill-Process
# Find and kill a process
function kps() {
  kill `ps aux | rff | awk '{print $2 }'`
}

# Git-Select-Branch
# Checkout a branch
function gsb() {
  git branch --all --remotes | cut -c 3- | rev | cut -d "/" -f 1 | rev | rff | xargs git checkout
}
