HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE    # don't nice background tasks
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS   # allow functions to have local traps

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# dont' expand aliases _before_ completion
setopt complete_aliases

export LSCOLORS="Gxfxcxdxbxegedabagacad"

# pretty colors - enables nice-looking prompt.
setopt prompt_subst
