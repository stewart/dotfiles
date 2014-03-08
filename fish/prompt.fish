function ruby_prompt -d "Prints current Ruby version in use"
  set ruby (which ruby)

  printf " using "

  set_color red -o

  if test ruby -eq "/usr/bin/ruby"
    printf "system"
  else
    printf "%s" (echo (basename $RUBY_ROOT))
  end

  set_color normal
end

function git_prompt -d "Prints current Git status"
  if git rev-parse --show-toplevel >/dev/null 2>&1
    printf ' on '

    set_color red -o
    printf '%s' (git rev-parse --abbrev-ref HEAD ^/dev/null)
    git_prompt_status
    set_color normal
  end
end

function git_prompt_status -d "Indicates whether the git status is dirty"
  git diff-index --quiet HEAD --

  if test $status -eq 1
    printf '*'
  end
end

function fish_prompt
  set last_status $status
  set_color normal

  set_color green -o
  printf "%s" (whoami)
  set_color normal

  printf " at "

  set_color -o yellow
  printf "%s" (hostname | cut -d . -f 1)
  set_color normal

  printf " in "

  set_color cyan
  printf "%s" (basename (pwd))
  set_color normal

  git_prompt

  ruby_prompt

  echo

  if test $last_status -eq 0
    set_color green -o
  else
    set_color red
  end

  printf "λ "
end

# remove greeting
set -g -x fish_greeting ''
