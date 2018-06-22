# Bash Scripting 

[Article](http://www.compciv.org/recipes/cli/reusable-shell-scripts/)

#### <span style="style="color:red">Project Goals </span>
```
Allow users to import custom .vimrc and/or .bashrc into non-local environment such as 
Stage or Production with the least amount of CMDs required in the terminal
```
#### TODO
```
Create github shell script
Allow users to curl URL
Instruct user to execute CMDs 
```

## Test Run

#### Creating Bash Script
```
vim shakespeare_shell_script.sh
```
Copy the following code into the editor
```
data_url='http://stash.compciv.org/scrapespeare/shakespeare-plays-flat-text.zip'
data_subdir='./shakespeare-plays-flat-text'

# test to see if data has been downloaded
# if not, then download it and tell the user about it
if ! [[ -d "$data_subdir" ]]; then
  echo '-------------------'
  echo "First-time installation process..."
  echo "...Downloading from $data_url"
  curl -so shakespeare.zip $data_url
  unzip shakespeare.zip
  echo "Done installing data!"
  echo "-------------------"
fi

# test to see if the second argument, minimum number of word chars
# has been set. If not, it defaults to 1
if [[ -z $2 ]]; then
  mval=1
else
  mval=$2
fi

# test to see if the third argument, maximum number of word chars
# has been set. If not, there is no maximum word length
if [[ -z $3 ]]; then
  regex="[[:alpha:]]{$mval,}"
else
  regex="\b[[:alpha:]]{$mval,$3}\b"
fi

cat "./shakespeare-plays-flat-text/$1.txt" | \
  tr [[:upper:]] [[:lower:]] | \
  grep -oE "$regex" | \
  sort | uniq -c | \
  sort -rn | head -n 10
```
Save and quit

#### Shell Commands
Run one of the following CMDs
```
bash shakespeare_shell_script.sh othello 5 7
bash shakespeare_shell_script.sh romeo_juliet 5 7
```
Some results should return
