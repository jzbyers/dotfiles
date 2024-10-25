# Notes

I'm keeping my Alacritty config around in case I feel like switching back in 
the future, but I'm currently using Kitty as my terminal emulator.

## Fresh setup

### MacOS

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

- Install Xcode
- Install Homebrew
- Open Terminal and then:
    1. Install Git and setup SSH keys: `brew install git`
    2. Create `src` directory and subdir for my personal github: `mkdir -p src/jzbyers && cd src/jzbyers`
    3. Clone dotfiles: `git clone git@github.com:jzbyers/dotfiles.git`
    4. Install dotfiles: `make install`

