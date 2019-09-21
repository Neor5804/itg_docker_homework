FROM ubuntu

MAINTAINER Vadim Bykau <vadim.bykau@silkdata.ai>

ENV TZ=Europe/Minsk

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y &&\
	apt-get install -y apache2 curl php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-cli

RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

COPY wordpress.conf /etc/apache2/sites-available/wordpress.conf
COPY apache2.conf /etc/apache2/apache2.conf
COPY dir.conf /etc/apache2/mods-enabled/dir.conf

RUN a2enmod rewrite &&\
	ln -s /etc/apache2/sites-available/wordpress.conf /etc/apache2/sites-enabled/wordpress.conf &&\
	rm /etc/apache2/sites-enabled/000-default.conf &&\
	apache2ctl configtest &&\
        service apache2 restart

RUN curl -SOk https://wordpress.org/latest.tar.gz &&\
       tar -xzf latest.tar.gz --strip 1

COPY wp-config.php /var/www/wordpress/wp-config.php

RUN touch /var/www/wordpress/.htaccess &&\
	chown -R www-data:www-data /var/www/wordpress &&\
	find /var/www/wordpress/ -type d -exec chmod 750 {} \; &&\
	find /var/www/wordpress/ -type f -exec chmod 640 {} \;

EXPOSE 80

CMD apachectl -D FOREGROUND
