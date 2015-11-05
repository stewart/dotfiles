# Tail system.log - from @ttscoff
function console() {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}

function server() { # via https://gist.github.com/1525217
    local host=`hostname`
    local port="${1:-8888}"
    (sleep 1 && open "http://${host}:${port}/")&
    python -m SimpleHTTPServer "$port"
}

function newfile() {
  local dir=$(find . -maxdepth 15 -type d |
    egrep -v '^./(node_modules|vendor/bundle|.git)' |
    sort -u |
    fzy
  )

  echo ''

  local filename=
  vared -p "$dir/" filename

  touch "$dir/$filename"
}
