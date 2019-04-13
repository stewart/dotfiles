# Use fuzzy finder for finding paths
# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol

# Run fuzzy finder in the current working directory, appending the selected
# path, if any, to the current command, followed by a space.
function insert-fuzzy-path-in-command-line() {
    local selected_path
    # Print a newline or we'll clobber the old prompt.
    echo
    # Find the path; abort if the user doesn't select anything.
    selected_path=$(fd | rff) || return
    # Append the selection to the current command buffer.
    eval 'LBUFFER="$LBUFFER$selected_path "'
    # Redraw the prompt since Selecta has drawn several new lines of text.
    zle reset-prompt
}

# Create the zle widget
zle -N insert-fuzzy-path-in-command-line

# Bind the key to the newly created widget
bindkey "^S" "insert-fuzzy-path-in-command-line"
