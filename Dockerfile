FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install openssl 
RUN apt-get -y install wget
RUN apt-get -y install tar
RUN apt-get -y install php7.3-fpm php7.3-mysql php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-zip php7.3-soap 

COPY ./srcs/container.sh .
COPY ./srcs/nginx-conf ./tmp/nginx-conf
COPY ./srcs/wp-config.php .
COPY ./srcs/phpmyadmin.inc.php .
COPY ./srcs/database.sql .

CMD bash container.sh