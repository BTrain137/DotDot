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

# Directory
alias diskusage="df -h"
alias folderusage="du -ch"
alias totalfolderusage="du -sh"

# bash variables
alias wrap_args='f(){ echo before "$@" after;  unset -f f; }; f'
alias playWord='f(){ echo before "$1" middle  "$2" after;  unset -f f; }; f'

# Git
alias gitLazy='f(){ git add . && git commit -a -m "$1" && git push -u origin "$2"; unset -f f; }; f'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

# gives iterm 2 an arrow
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# reminder
# chsh          :Change shell /bin/zsh ||  /bin/bash
