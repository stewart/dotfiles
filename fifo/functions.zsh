exec-fifo () {
  local FIFO="/tmp/fifo"

  if [ ! -p $FIFO ]; then
    mkfifo $FIFO
  fi

  while true; do
    sh -c "$(cat $FIFO)"
  done
}
