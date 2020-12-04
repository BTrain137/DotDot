To push code from a develop branch into a new repo's master or branch
```bash
$ git push <anthoer repo> +currentBranch:otherReposBranch
```

```
$ git reset --soft 032dc22604fbe
# Moves the head pointer to a commit but leaves the changed files in stage area
# Can rename commit messages or unstage files. Safest reset. 

$ git reset --mix 032dc22604fbe
# Moves the head pointer to a commit but leaves the changed in unstaged

$ git reset --hard 032dc22604fbe
# Moves the head pointer to a commit but also removes all modified files
```

Helpful Git Logs
```
$ git log --oneline --graph --all --decorate
$ git log --oneline --graph
$ git log --stat --summary
$ git diff --stat --summary cc2e2d2..HEAD
$ git show cc2e2d2 HEAD 
$ git show cc2e2d2 HEAD index.html
```

```
$ git branch --merge
# matches the other branchs that are contained in it so be deleted. 
# If I am on the master and run the CMD then it shows me the other branches that I can delete 
# because the master contains all the code within that branch
```

```
$ git log --graph --decorate --oneline --all ^master^!
# View the master branch and all the branches relative to it
```

```
$ git push <anthoer repo> +currentBranch:otherReposBranch
# To push code from a develop branch into a new repo's master or branch
```
