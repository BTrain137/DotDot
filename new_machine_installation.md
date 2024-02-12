# New Machine Installation

Mac > Settings > Trackpad > "Tap to click"

Mac > Settings > Keyboard > Key Board Shortcut > Modifier Keys > Cap lock Key => Escape

Mac > Settings > Keyboard > Delay until repeat > Shortest possible

Manually Install [iterm2](https://iterm2.com/)

iterm 2 settings:
Settings > profile > terminal > "Unlimted scroll back"
Settings > Window > Columns > 160
Settings > Window > Width > 30
Settings > Text > Font > Size > 16

Mac > Settings > Privacy & Security > Files and Folders > iterm > Documents Folder



Open terminal
```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/bryantran/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
```

Oh my zshell
```bash
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

