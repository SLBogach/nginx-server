CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'root';
update mysql.user set plugin='mysql_native_password' where User='root' ;
FLUSH PRIVILEGES;
