service mysql start

mkdir /var/www/my_domain 
chown -R www-data:www-data /var/www/my_domain
touch /var/www/my_domain/index.php
echo "<?php phpinfo(); ?>" >> /var/www/my_domain/index.php

# SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/my_domain.pem -keyout /etc/nginx/ssl/my_domain.key -subj "/C=FR/ST=Moscow/L=Moscow/O=42 School/OU=rchallie/CN=my_domain"

# Config NGINX
mv ./tmp/nginx-conf /etc/nginx/sites-available/my_domain
ln -s /etc/nginx/sites-available/my_domain  /etc/nginx/sites-enabled/

# Config MYSQL
mv ./database.sql /var/www/
mariadb < /var/www/my_domain/phpmyadmin/sql/create_tables.sql
mariadb < /var/www/database.sql

# PHPmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz 
mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/my_domain/phpmyadmin
mkdir -p /var/www/my_domain/phpmyadmin/tmp
chown -R www-data:www-data /var/www/my_domain/phpmyadmin
mv ./phpmyadmin.inc.php /var/www/my_domain/phpmyadmin/phpmyadmin.inc.php

# Wordpress
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/my_domain
mv ./wp-config.php /var/www/my_domain/wordpress

service php7.3-fpm start
service nginx start
bash