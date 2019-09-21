FROM ubuntu

USER root

RUN apt-get update && apt-get upgrade -y &&\
	apt-get install -y apache2 vim curl php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip

RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

COPY wordpress.conf /etc/apache2/sites-available/wordpress.conf

RUN a2enmod rewrite &&\
	ln -s /etc/apache2/sites-available/wordpress.conf /etc/apache2/sites-enabled/wordpress.conf &&\
	rm /etc/apache2/sites-enabled/000-default.conf &&\
	apache2ctl configtest &&\
        service apache2 restart

COPY wordpress /var/www/wordpress

RUN mkdir /var/www/wordpress/wp-content/upgrade
RUN chown -R www-data:www-data /var/www/wordpress &&\
	find /var/www/wordpress/ -type d -exec chmod 750 {} \; &&\
	find /var/www/wordpress/ -type f -exec chmod 640 {} \;

RUN ls -lah /var/www/wordpress

CMD apachectl -D FOREGROUND
