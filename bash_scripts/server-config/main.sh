USER=ubuntu
IP=54.224.246.233
KEY_PEM=../aws/bt-testing-06.pem
KEY_SSH_PUB=id_rsa_btran-teefury.pub
KEY_SSH_PRIVATE=id_rsa_btran-teefury

ssh -i $KEY_PEM $USER@$IP 'bash -s' < create-history.sh

echo -e "\n=============Created Bash History==============="

# No Transering creating user on host locally
read -p "What is your username: " NEWUSER
ssh -i $KEY_PEM $USER@$IP NEWUSER=$NEWUSER 'bash -s' << 'ENDSSH'
  sudo adduser --disabled-password --gecos "" $NEWUSER &&
  sudo mkdir /home/$NEWUSER/.ssh &&
  sudo chmod 700 /home/$NEWUSER/.ssh 
ENDSSH

echo -e "\n==========Created New User================="

# # Transfer keys up to host. Must transfer to temp due to permssions
ssh -i $KEY_PEM $USER@$IP 'mkdir ~/temp'
scp -i $KEY_PEM ~/.ssh/$KEY_SSH_PUB $USER@$IP:/home/$USER/temp/

echo -e "\n==========Transfered SSH PUB Key==========="

# # Set permissions to new user created
ssh -i $KEY_PEM $USER@$IP NEWUSER=$NEWUSER KEY_SSH_PUB=$KEY_SSH_PUB USER=$USER 'bash -s' << 'ENDSSH'
  sudo mv /home/$USER/temp/$KEY_SSH_PUB /home/$NEWUSER/.ssh/authorized_keys
  sudo rm -r /home/$USER/temp
  sudo chmod 600 /home/$NEWUSER/.ssh/authorized_keys && 
  sudo chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh/
ENDSSH

echo -e "\n==========Moved SSH PUB to USER .ssh======="

ssh -i ~/.ssh/$KEY_SSH_PRIVATE $NEWUSER@$IP 'bash -s' < create-history.sh

echo -e "\n==========Bash History====================="

# SSH with $NEWUSER
ssh -i ~/.ssh/$KEY_SSH_PRIVATE $NEWUSER@$IP
