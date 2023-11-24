My dotfiles are perpetually a work in progress, and I might not even use all of
these files, but here's a 10,000 foot overview.

# Editor

It depends! I switch things up every year or so.

These days, I use Neovim for scripting, making small edits, or learning new 
languages; and I tend to use Jetbrains IDE's with IdeaVim when working on larger 
projects.

There will always be a special place in my heart for Sublime Text 🖤. In fact, I 
still use it a lot to read code or explore unfamiliar codebases.

# Fonts

Inconsolata font family

# Terminal Emulator

I've been using Alacritty for a few years now. Alacritty basically has two 
tenets: speed and simplicity. I certainly appreciate its GPU-accelerated 
rendering and I love its minimal feature-set and approach to configuration, 
though I love it most because it's cross-platform. Depending on what I'm doing,
I'm either using MacOS, Debain, or Windows, and I really appreciate being able
to have a consistent terminal experience.

## Alacritty + Tmux

In some situations, I value being able to create tabs and horizontal or vertical 
panes. To do this in Alacritty, I use `tmux`. 

Commands in `tmux`, however, must be prefixed. This makes the keybindings for 
creating tabs and panes a little difficult - makes me feel like I'm using Emacs 
again 😂. 

One of my favorite features of Alacritty is its ability to send escape sequences 
in hexcode for custom keyboard shortcuts. This allows me to remap `tmux` 
keybindings to whatever I want, so instead of pressing `ctrl-f c` to create a 
tab, I can remap that to `cmd + t` (using a Mac keyboard here for example).

All of my keyboard shortcuts can be found in `alacritty.toml`.



