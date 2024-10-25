# Dotfiles 

## Fresh setup for MacOS

- System Settings
    - Keyboard
        - Key Repeat: Fast
        - Delay Until Repeat: Short
    - Trackpad
        - Tap to click
        - Tracking speed: 6th notch
    - Mouse
        - Tracking speed: 7th notch
        - Double-click speed: 8th notch
        - Scrolling speed: 4th notch
    - Desktop & Dock
        - Position on screen: Left
        - Automatically hide and show the Dock: On
- Install Xcode from App Store
- Install [Homebrew](https://brew.sh/)
- Download [InconsolataGo Nerd Font](https://www.nerdfonts.com/font-downloads) and load into Font Book
- Use Terminal to:
    1. Install Git and setup SSH keys: `brew install git`
    2. Create `src` directory and subdir for my personal github: `mkdir -p src/jzbyers && cd src/jzbyers`
    3. Clone dotfiles: `git clone git@github.com:jzbyers/dotfiles.git`
    4. Install dotfiles: `make install`
- Install [Kitty](https://sw.kovidgoyal.net/kitty/)
