function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

set -gx PATH /usr/bin /bin /usr/sbin /sbin

prepend_to_path /usr/local/share/python
prepend_to_path /usr/local/share/npm/bin
prepend_to_path /usr/local/heroku/bin
prepend_to_path /usr/local/sbin
prepend_to_path /usr/local/bin
prepend_to_path /usr/bin
prepend_to_path $HOME/.dotfiles/bin
prepend_to_path $HOME/go/bin
prepend_to_path $HOME/bin
prepend_to_path /bin
prepend_to_path ./bin
