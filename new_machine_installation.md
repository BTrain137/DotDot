# New Machine Installation

Mac > Settings > Trackpad > "Tap to click"

Mac > Settings > Keyboard > Key Board Shortcut > Modifier Keys > Cap lock Key => Escape

Mac > Settings > Keyboard > Delay until repeat > Shortest possible

Mac > Settings > Keyboard > Key repeat rate > Shortest possible


Manually Install [iterm2](https://iterm2.com/)

iterm 2 settings:
Settings > profile > terminal > "Unlimted scroll back" <br>
Settings > Window > Columns > 160 <br>
Settings > Window > Width > 30 <br>
Settings > Text > Font > Size > 16 <br>

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

TODO: Need to figure out correct vimrc

### Git

```bash
$ brew install git
```

Follow [create-SSH-key.md](./create-SSH-key.md) to add keys

### Git Guardian 

Add [git guardian](./gitguardian/01-full_ggshield_setup.sh) 

### Install VS Code

```
$ brew install --cask visual-studio-code
```

Sign into github to sync settings.
