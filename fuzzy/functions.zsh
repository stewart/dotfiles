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
  git branch | cut -c 3- | rff | xargs git checkout
}

# Fuzzily-Change-Directories
function fcd() {
  cd "$(fd --type d | rff)"
}
