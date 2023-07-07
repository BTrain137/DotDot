SET @some := 'bryantran';

SHOW DATABASES;

SELECT host, user, password 
FROM mysql.user 
WHERE user=@some;
