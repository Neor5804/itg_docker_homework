FROM httpd:2.4

RUN apt-get update && apt-get upgrade -y &&\
	apt-get install -y curl php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip

RUN mkdir -p /var/www/html
WORKDIR /var/www/html

#RUN curl -SOk https://wordpress.org/latest.tar.gz &&\
#	tar -xzf latest.tar.gz --strip 1
#COPY .htaccess /var/www/html/
#COPY wp-config.php /var/www/html/wp-config.php
#RUN cp wp-config-sample.php wp-config.php &&\
#	mkdir wp-content/upgrade

COPY wordpress /var/www/html

#RUN chown -R www-data:www-data /var/www/html/ &&\
#	chmod 660 .htaccess &&\
#	chmod 755 /var/www/html &&\
#	find /var/www/html -type d -exec chmod g+s {} \;
#	chmod g+w /var/www/html/wp-content &&\
#	chmod -R g+w /var/www/html/wp-content/themes &&\
#	chmod -R g+w /var/www/html/wp-content/plugins

#RUN curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> salt.list

RUN ls -lah /var/www/html
