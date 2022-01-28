# Dotfiles

Notes about what's going on here:
- `Brewfile.arm64` contains a bunch of stuff I've installed using Homebrew, but
  I don't do the best job maintaining it
- `alacritty.yml` configures Alacritty, my current terminal emulator of choice
- `bat.conf` configures [bat](https://github.com/sharkdp/bat)
- `git-completion.zsh` and `git-prompt.sh` I took from elsewhere
- `gitconfig` configures git
- `ideavimrc` configures the vim plugin for Jetbrains IDE's
- `init.vim` configures Neovim
- `psqlrc` configures psql for accessing Postgres databases
- `tmuxconf` configures tmux

A few more notes:
- Why do I use Alacritty? Idk but I love it! I originally cloned the repo to toy
  around with Rust, and then ended up spending tons of time trying to make it
  feel more like iTerm, which is the main reason why I use tmux as well. The
  result is that my `alacritty.yml` and `tmuxconf` configs are tightly coupled,
  because I configured key bindings in Alacritty to make the experience of
  Alacritty + tmux feel more like iTerm. The downside, of course, is that I
  don't know as many tmux commands as I should because they're all hidden behind 
  these key bindings. Shout out to Fatih Arslan for documenting a lot of this on
  [his blog](https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/).
- I'm a big fan of the Inconsolata font by Raph Levian but I use Inconsolata-g
  (also sometimes called InconsolataGo) mainly to get the straight single and
  double quotes. I use this in Alacritty and in all editors and IDEs.

