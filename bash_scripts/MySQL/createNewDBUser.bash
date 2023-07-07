# Create new user to access database
# Basic create granting all privileges to all database to new user

Use Login root or main account
read -p "Root or privileged user : " USER
read -p "New Database User: " DBUSER
read -p "Host (localhost or remote IP address): " HOSTNAME 
read -p "User Password: " DBUSERPASS 

# Execute mysql queries from bash
mysql -u $USER \
-e "SET @user := '${DBUSER}';

DROP USER IF EXISTS '${DBUSER}'@'${HOSTNAME}';

CREATE USER '${DBUSER}'@'${HOSTNAME}' IDENTIFIED BY '${DBUSERPASS}';

GRANT ALL PRIVILEGES ON * . * TO '${DBUSER}'@'${HOSTNAME}';

FLUSH PRIVILEGES;

SELECT host, user, password FROM mysql.user WHERE user = @user;"
