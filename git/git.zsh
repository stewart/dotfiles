# varied functions to add prompt additions
# indicating current status of git repo.
# handsomely stolen from oh-my-zsh.

# get the current branch
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$GIT_PROMPT_SUFFIX"
}

# checks if working tree is dirty
parse_git_dirty() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "$GIT_PROMPT_DIRTY"
  else
    echo "$GIT_PROMPT_CLEAN"
  fi
}

# checks if there are commits ahead from remote
function git_prompt_ahead() {
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "$GIT_PROMPT_AHEAD"
  fi
}

# formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$GIT_PROMPT_SHA_BEFORE$SHA$GIT_PROMPT_SHA_AFTER"
}

# formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
  SHA=$(git rev-parse HEAD 2> /dev/null) && echo "$GIT_PROMPT_SHA_BEFORE$SHA$GIT_PROMPT_SHA_AFTER"
}
