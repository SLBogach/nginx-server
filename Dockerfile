
FROM debian:buster

EXPOSE 80 443

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx \
                        default-mysql-server \
                        openssl \
                        wget \
                        tar \
                        nano \
                        php7.3-fpm \
                        php7.3-mysql \
                        php7.3-curl \
                        php7.3-intl \
                        php7.3-mbstring \
                        php7.3-xmlrpc \
                        php7.3-gd \
                        php7.3-xml \
                        php7.3-zip \
                        php7.3-soap 


COPY ./srcs/configure.sh .
COPY ./srcs/nginx-conf ./tmp/nginx-conf
COPY ./srcs/wp-config.php .
COPY ./srcs/phpmyadmin.php .
COPY ./srcs/database.sql .
COPY ./srcs/autoindex.sh .

RUN mkdir /var/www/my_domain 

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xf phpMyAdmin-4.9.0.1-all-languages.tar.gz 
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/my_domain/phpmyadmin

RUN mkdir -p /var/www/my_domain/phpmyadmin/tmp
RUN chown -R www-data:www-data /var/www/my_domain/phpmyadmin
RUN mv ./phpmyadmin.php /var/www/my_domain/phpmyadmin/phpmyadmin.php

RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN mv wordpress/ /var/www/my_domain
RUN mv ./wp-config.php /var/www/my_domain/wordpress

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/my_domain.key -x509 -days 365 -out /etc/nginx/ssl/my_domain.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21School/OU=SLBogach/CN=my_domain"

CMD bash configure.sh
