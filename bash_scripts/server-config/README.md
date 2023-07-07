```bash
$ chmod 755 ./main.sh #Make file executable
```

<!-- https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/ -->
```bash
scp -i key.pm file.txt user@host:/home/ubuntu/folder_location/
```

```bash
ssh user@host ARG1=$ARG1 ARG2=$ARG2 'bash -s' <<'ENDSSH'
  # commands to run on remote host
  echo $ARG1 $ARG2
ENDSSH

read -p "What is your username: " NEWUSER
ssh -i key.om user@host NEWUSER=$NEWUSER 'bash -s' << 'ENDSSH'
  touch ~/hello-world.txt
  echo -e '\n'$NEWUSER'\nYes' >> ~/hello-world.txt
ENDSSH
```

## Transferring create-user.sh to host to execute later
```bash
# Variables
USER=
IP=
KEY_PEM= 

ssh -i $KEY_PEM $USER@$IP 'mkdir ~/bash_scripts'
scp -i $KEY_PEM create-user.sh $USER@$IP:~/bash_scripts/
ssh -i $KEY_PEM $USER@$IP 'chmod 755 ~/bash_scripts/create-user.sh'
```
