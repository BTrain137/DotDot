-- Create variable to be used later
-- Cannot use to create user or delete user. Only for queries
SET @user := 'new_user';

-----------------------------------------------
-- Delete user
DROP USER IF EXISTS 'new_user'@'localhost';

-----------------------------------------------
-- Create user with password
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'new_password';

-- Grant create update delete to newly created user 
GRANT ALL PRIVILEGES ON * . * TO 'new_user'@'localhost';

FLUSH PRIVILEGES;

------------------------------------------------
-- Users
SELECT host, user, password FROM mysql.user;

SELECT host, user, password FROM mysql.user WHERE user = @user;
