# dotfiles

Hi. These are my dotfiles. I use:

- OS X
- zsh
- git
- Homebrew
- Ruby
- vim
- chruby

## install

- `git clone --recursive https://github.com/stewart/dotfiles.git ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

## moving parts

There are a few special files in here:

- **topic/\*.zsh** - Any files ending with a `.zsh` extension are automatically loaded into your environment.
- **topic/\*.symlink** - Any files ending with a `.symlink` extension are symlinked to your `$HOME` on `rake install`. This is so you can keep everything versioned in git and still keep everything in your home directory for autoloading.
- **topic/completion.sh** - Any files named `completion.sh` are loaded last, after zsh's autocomplete functions are set up.

## but wait, there's more!

These will make things more awesome:

- ack
- coreutils
- grc
- hub
- postgresql
- chruby
- reattach-to-user-namespace
- redis
- ruby-build
- ssh-copy-id
- tmux
- vim (from homebrew/dupes)
- z

## thanks

Most of this stuff, including the topic-centric layout and `Rakefile`, comes from [@holman][]'s own [dotfiles repo][@holman dotfiles].

[@holman]: http://twitter.com/holman
[@holman dotfiles]: https://github.com/holman/dotfiles
