# BASIC Setup local gitguardian

Local `gitguardian` is intended to prevent accidental keys from being deployed a remote remote.
Pre-commit is used to block commits with keys even before `git push`

WARNING!!! This installation guide uses brew

Requirements: 
  - Mac OS
  - Homebrew

## Setup new repos (cloned and init):

### #1 Sign up:
Sign up for [gitguardian.com](https://dashboard.gitguardian.com/auth/signup)

### #2 Clone repo and setup `ggshield`:
```bash
$ git clone repo
$ cd <DIRECTORY>/DOTDOT/gitguardian
$ bash 01-full_ggshield_setup.sh
```

### #3 Authenticate local `ggshield`:
```bash
$ ggshield auth login
```

### #4 Code safely!

Once you setup pre-commits with `ggshield` every repo will now have automatic secret detection

#### What it looks like when you accidentally commit a secret
```
➜  secret-shield-project git:(main) ✗ git add .                       
➜  secret-shield-project git:(main) ✗ git commit -m "OOPS I forgot a secret"
Scanning... ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 1 / 1

> commit://staged/.env: 1 incident detected

>> Secret detected: Generic High Entropy Secret
   Validity: No Checker
   Occurrences: 1
   Known by GitGuardian dashboard: NO
   Incident URL: N/A
   Secret SHA: dbd5f2f3ffbc1495d4d1f6caf1f26f637ee31839428fd3c0553d2649eaec227c

    | @@ -0,0 +1 @
  1 | SUPER_SECRET=138410*********************434223
                   |_____________apikey____________|

> How to remediate

  Since the secret was detected before the commit was made:
  1. replace the secret with its reference (e.g. environment variable).
  2. commit again.

> [To apply with caution] If you want to bypass ggshield (false positive or other reason), run:
  - if you use the pre-commit framework:

     SKIP=ggshield git commit -m "<your message>"

  - otherwise (warning: the following command bypasses all pre-commit hooks):

     git commit -m "<your message>" --no-verify
➜  secret-shield-project git:(main) ✗ 
```

###  Normal commits

```
➜  secret-shield-project git:(main) ✗ git add .
➜  secret-shield-project git:(main) ✗ git commit -m "init project"
Scanning... ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 2 / 2

No secrets have been found

[main 5744e91] testing ggshield
 2 files changed, 2 insertions(+)
 create mode 100644 index.html
 create mode 100644 ./javascript/index.js
```

## Setup existing repos:

It is assumed you followed all the steps for the new setup.
This script is to add the pre-commit for all .git projects within a parent directory.

Warning the `path` is absolute path from the `root` directory and <b>NOT</b> the home directory

```bash
$ base 02-add_pre_commit_hooks.sh
```

```bash
Enter the path to your parent directory: 
~/Users/<USER>/my_code

# Successfully added pre-commit
Added pre-commit hook to ~/Users/<USER>/my_code/awesome_project/.git

# Skipping repos with pre-commit already setup
# We don't want to overwrite existing pre-commit scripts we will be skipping
Existing pre-commit hook found in ~/Users/<USER>/my_code/pre_commit_setup/.git Skipping...
```
