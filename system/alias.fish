# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if gls >/dev/null 2>&1
  alias ls "gls -F --color"
  alias l "gls -lAh --color"
  alias ll "gls -l --color"
  alias la 'gls -A --color'
end

# shove public key to clipboard
alias pubkey "cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
