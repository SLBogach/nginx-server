service mysql start

chown -R www-data:www-data /var/www/my_domain

mv ./tmp/nginx-conf /etc/nginx/sites-available/my_domain
ln -s /etc/nginx/sites-available/my_domain  /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

mv ./database.sql /var/www/
mariadb < /var/www/database.sql

service php7.3-fpm start
service nginx start
bash
