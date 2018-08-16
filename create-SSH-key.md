# Create SSH - Simple keys 

## Purpose 

    Creating SSH key for multiple simple destinations (Github, Visual studio team services)

## Steps

``` bash
$ cd ~/
$ ssh-keygen -t rsa

# A prompt will appear and ask. $USER is the user logged in to the machine
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/<$USER>/.ssh/id_rsa):
```

### Do not accept, Type in the name of service the key will be associated to with. 
<service> is the variable in which you want to associate to such as _github or _AWS-production-site

```bash
Enter file in which to save the key (/Users/<$USER>/.ssh/id_rsa): /Users/<$USER>/.ssh/id_rsa_<service>
```

### Check if the newly created key was created

```bash
$ ls ~/.ssh
# This could potentially look like
id_rsa    id_rsa.pub     id_rsa_<service>    id_rsa_<service>.pub
```

### Copy the content of public the key into clipboard

```bash
# window, CAT only prints the content to the terminal. Must physically highlight and copy
$ cat ~/.ssh/id_rsa_<service>.pub
# MAC
$ pbcopy < ~/.ssh/id_rsa_<service>.pub 

# Take the copied key the service that required it
```

### Add the SSH key to the machine

```bash
$ ssh-add ~/.ssh/id_rsa_<service>
```

## TODO
- Complex keys for AWS or digital ocean