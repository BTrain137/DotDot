# Delete user from database

read -p "Root or privileged user : " USER
read -p "New Database User: " DBUSER
read -p "Host (localhost or remote IP address): " HOSTNAME 

mysql -u $USER -p \
-e "DROP USER IF EXISTS '${DBUSER}'@'${HOSTNAME}';

-- If a row shows up then user was not deleted
SELECT host, user, password FROM mysql.user WHERE user = '${DBUSER}';"
