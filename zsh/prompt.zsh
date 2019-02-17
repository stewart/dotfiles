autoload colors && colors

export MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

export PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%}$(git_prompt_info) %{$reset_color%}
%(?.%{$fg[green]%}.%{$fg[red]%})λ %{$reset_color%}'

export GIT_PROMPT_PREFIX="[%{$fg_bold[red]%}"
export GIT_PROMPT_SUFFIX="%{$reset_color%}]"
export GIT_PROMPT_DIRTY="*"
export GIT_PROMPT_CLEAN=""
