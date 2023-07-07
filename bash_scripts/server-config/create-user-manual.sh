sudo adduser --disabled-password --gecos newuser
sudo su - newuser
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
vim .ssh/authorized_keys
