autoload colors && colors

export MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

export PROMPT='%{$fg[green]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg[cyan]%}%c$(git_prompt_info) %{$reset_color%}$(rb_prompt)
%(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%})✈%{$reset_color%} '

export GIT_PROMPT_PREFIX=" %{$fg[blue]%}on%{$reset_color%} %{$fg_bold[red]%}"
export GIT_PROMPT_SUFFIX="%{$reset_color%}"
export GIT_PROMPT_DIRTY=""
export GIT_PROMPT_CLEAN=""

export RPROMPT='${return_status} $(git_prompt_status) %{$reset_color%}'

export GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
export GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
export GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
export GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
export GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
export GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

rb_prompt(){
  if $(which rbenv &> /dev/null)
  then
    echo "using %{$fg_bold[red]%}$(rbenv version | awk '{print $1}')%{$reset_color%}"
  else
    echo ""
  fi
}
