function reverse-proxy-port() {
  ssh -NR 9999:localhost:$1 stwrt.ca
}
