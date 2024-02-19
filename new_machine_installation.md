# New Machine Installation

Mac > Settings > Trackpad > "Tap to click"

Mac > Settings > Keyboard > Key Board Shortcut > Modifier Keys > Cap lock Key => Escape

Mac > Settings > Keyboard > Delay until repeat > Shortest possible

Mac > Settings > Keyboard > Key repeat rate > Shortest possible

```bash
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

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

#### Add github to config
```
# ~/.ssh/config

# Default github account
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_github
```

### Git Guardian 

Add [git guardian](./gitguardian/01-full_ggshield_setup.sh) 

### Install VS Code

```
$ brew install --cask visual-studio-code
```

Sign into github to sync settings.

### Install NVM for node and npm

```bash
$ brew install nvm
$ mkdir ~/.nvm
$ nvm install node
```

### Other development requirements
```bash
$ brew install postgresql
$ brew install redis
```

### Create postgresql local user
```bash
$ psql -h localhost -d postgres

# In postgres CLI
CREATE USER btrain --no-password;
ALTER USER btrain WITH CREATEDB;
```
