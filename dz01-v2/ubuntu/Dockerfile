FROM ubuntu

MAINTAINER Vadim Bykau <vadim.bykau@silkdata.ai>

ENV TZ=Europe/Minsk

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update &&\
	apt-get install -y software-properties-common vim curl php-fpm php-mysql

RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

COPY info.php /var/www/wordpress/info.php

RUN curl -SOk https://wordpress.org/latest.tar.gz &&\
       tar -xzf latest.tar.gz --strip 1

COPY wp-config.php /var/www/wordpress/wp-config.php

RUN touch /var/www/wordpress/.htaccess &&\
	chown -R www-data:www-data /var/www/wordpress &&\
	find /var/www/wordpress/ -type d -exec chmod 750 {} \; &&\
	find /var/www/wordpress/ -type f -exec chmod 640 {} \;

EXPOSE 8080

CMD ["php-fpm"]
