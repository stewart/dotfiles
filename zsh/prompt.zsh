autoload colors && colors

export MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

export PROMPT='%{$fg[green]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg[cyan]%}%c$(git_prompt_info) %{$reset_color%}$(rb_prompt)
%(?.%{$fg_bold[green]%}.%{$fg[red]%})λ %{$reset_color%}'

export GIT_PROMPT_PREFIX=" %{$fg[blue]%}on%{$reset_color%} %{$fg_bold[red]%}"
export GIT_PROMPT_SUFFIX="%{$reset_color%}"
export GIT_PROMPT_DIRTY="*"
export GIT_PROMPT_CLEAN=""

rb_prompt(){
  if [[ $(which ruby) == "/usr/bin/ruby" ]]
  then
    echo "using %{$fg_bold[red]%}system%{$reset_color%}"
  else
    echo "using %{$fg_bold[red]%}$(echo $(basename $RUBY_ROOT))%{$reset_color%}"
  fi
}
