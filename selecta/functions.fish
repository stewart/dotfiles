function tsa
  tmux ls | sort | selecta | cut -f1 -d: | xargs -o tmux attach -t
end

function vif
  find * -type f -or -type l -maxdepth 15 | egrep -v '^(node_modules|vendor/bundle)' | sort -u | selecta | xargs -o vim
end

function kps
  ps aux | selecta | awk '{print $2 }' | xargs -o kill
end

function gsb
  git branch --all --remotes | cut -c 3- | rev | cut -d "/" -f 1 | rev | selecta | xargs git checkout
end
