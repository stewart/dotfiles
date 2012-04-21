# Tail system.log - from @ttscoff
function console() {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}

# Runs a simple web server from the folder you're currently in.
# Takes a port number as an argument.
#
# From @padolsey's comment on this gist: gist.github.com/1525217
function server() {
  open "http://localhost:$1" && python -m SimpleHTTPServer $1
}
