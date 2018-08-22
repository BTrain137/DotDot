# Ubuntu-vm-docker

### Purpose
Commands to create a VM like ubtuntu environment to Mimic AWS

```bash
$ docker pull ubuntu:xenial
$ docker run --name myubuntuplay ubuntu bash # Get into ubuntu environment
```

### Once in Docker Ubuntu installation of many programs are required
```bash
$ apt-get update && apt-get install -y sudo \
    && rm -rf /var/lib/apt/lists/*              # Gives back Sudo CMD
$ sudo apt remove -y vim-tiny                   # Remove vi if installed
$ sudo apt update.                              # Update package list
$ sudo apt install -y vim                       # Install Vim and Yes flag
$ sudo apt-get install git-core                 # Git verison control
$ sudo apt-get update
$ sudo apt-get install curl                     # Curl to install over https
$ sudo apt-get update
```

### Fun Configerations
```bash
$ curl https://raw.githubusercontent.com/bryan89tran/DotDot/master/.vimrc --output .vimrc
$ curl https://raw.githubusercontent.com/bryan89tran/DotDot/master/.bashrc --output .bashrc
```

### 
```bash
$ sudo apt-get install nginx                    # Install nginx
$ sudo apt-get update
$ vim /etc/nginx/nginx.conf                     # Conf for server
$ ll /etc/init.d/nginx                          # Execute the program
```
