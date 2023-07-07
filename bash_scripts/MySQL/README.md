# Mysql bash scripting

The following bash examples can be copied and ran as an individual file

****
### Simple login
Login and stay in mysql terminal
```bash
read -p "Database Username: " USER

mysql -u $USER -p

```

****
### Login and show databases
Go into mysql and type commands but exits when all commands have been executed
```bash
read -p "Database Username: " USER

mysql -u $USER -p <<EOF
SHOW DATABASES;
EOF
```

****
### Show databases with MY_QUERY
Using command called MY_QUERY to execute many SQL queries
```bash
read -p "Database Username: " USER

mysql -u $USER <<MY_QUERY
SHOW DATABASES;
MY_QUERY
```

****
### Create new user
Create user then list existing user <br />
This method is hard coded
```bash
read -p "Database Username: " USER

mysql -u $USER -p <<EOF
-- Delete user if they exist 
DROP USER IF EXISTS 'new_user'@'localhost';

-- Create user with password
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'new_password';

-- Grant create update delete to newly created user 
GRANT ALL PRIVILEGES ON * . * TO 'new_user'@'localhost';

FLUSH PRIVILEGES;

-- Show all users 
SELECT host, user, password FROM mysql.user;
EOF
```

****
### Delete User
Delete user
```bash
# 
read -p "Database Username: " USER

mysql -u $USER -p <<EOF
-- Delete user if they exist 
DROP USER IF EXISTS 'new_user'@'localhost';
EOF
```

****
### Delete User Dynamic
Cannot SET anything with @. Cannot do this SET @some := 'some_user'@'localhost'
```bash
read -p "Database Username: " USER
read -p "Which user to delete" DBUSER

mysql -u $USER \
-e "DROP USER IF EXISTS '${DBUSER}'@'localhost';
SELECT host, user, password FROM mysql.user WHERE user = '${DBUSER}';"
```

****
### Able to use variable from bash
Must be a string for mysql to evaluate
```bash
read -p "Database Username: " USER
DATABASE=mysql
DBUSER=new_user

mysql -u $USER \
-e "SHOW DATABASES;
USE ${DATABASE}; 
SELECT host, user, password FROM mysql.user WHERE user='${DBUSER}';"
```

****
### Login and show databases and use database with variable from mysql
Using bash variable but setting variable as mysql variables first
```bash
read -p "Database Username: " USER
DATABASE=mysql
DBUSER=new_user

mysql -u $USER \
-e "SET @user := '${DBUSER}';
SHOW DATABASES;
USE ${DATABASE}; 
SELECT host, user, password FROM mysql.user WHERE user = @user;"
```

