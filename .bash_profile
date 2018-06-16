alias ll='ls -la'                             # Detailed list with hidden files
alias lt='ls -la -t'                          # Detailed list ordered by created
alias lrt='ls -la -rt'                        # Detailed list ordered by created (reverse)


alias mamp="/Applications/MAMP/Library/bin/mysql --host=localhost -uroot -proot" #Run mamp 
alias ll="ls -al"                             # List all files in current directory in long list format
alias ldir="ls -al | grep ^d"                 # List all directories in current directory in long list format
alias ut="uptime"                             # Computer uptime, To see how long our Mac has gone without a restart

alias publicIP="curl ipecho.net/plain; echo"  # System's public IP
alias networkIP="ipconfig getifaddr en0"      # System Preferences, select Network and then view our IP address information

alias download="curl -O"                      # Open a download connection with CURL 
alias ping="ping -c 10"                       # Get IP address or to see if a website might be down

alias who="whois"                             # find more info on the site 
alias trace="traceroute"                      # network debug

alias ll="ls -la"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# test functions to place arguments in bash
myfunction () {
    echo '$1'
    echo '$1'
}

alias wrap_args='f(){ echo before "$@" after;  unset -f f; }; f'

# all in one git command 
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
alias gitFinish='f(){ git add . && git commit -m "$@" && git push; unset -f f; }; f'

# gives iterm 2 an arrow
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# reminder 
# chsh                                        #Change shell /bin/zsh ||  /bin/bash
