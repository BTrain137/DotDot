In the order of output;

```bash
-rwxrw-r--    1    root   root 2048    Jan 13 07:11 afile.exe
```
file permissions,
number of links,
owner name,
owner group,
file size,
time of last modification, and
file/directory name
File permissions is displayed as following;

first character is - or l or d, d indicates a directory, a line represents a file, l is a symlink (or soft link) - special type of file
three sets of characters, three times, indicating permissions for owner, group and other:
r = readable
w = writable
x = executable
In your example -rwxrw-r--, this means the line displayed is:

a regular file (displayed as -)
readable, writable and executable by owner (rwx)
readable, writable, but not executable by group (rw-)
readable but not writable or executable by other (r--)
