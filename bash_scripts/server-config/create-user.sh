# Help ful CMD

# Delete user and group
# sudo userdel 
# sudo delgroup

read -p "What is your username: " NEWUSER

sudo adduser --disabled-password --gecos "" $NEWUSER &&
sudo mkdir /home/$NEWUSER/.ssh &&
sudo chmod 700 /home/$NEWUSER/.ssh &&
sudo touch /home/$NEWUSER/.ssh/authorized_keys &&
sudo chmod 600 /home/$NEWUSER/.ssh/authorized_keys && 
sudo chown -R $NEWUSER:$NEWUSER /home/$NEWUSER/.ssh/ &&
sudo su - $NEWUSER
