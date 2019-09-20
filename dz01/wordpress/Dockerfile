FROM httpd:2.4

RUN apt-get update && apt-get upgrade -y &&\
	apt-get install -y curl php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip

#get latest wordpress
#WORKDIR /usr/local/apache2/htdocs/
RUN mkdir -p /var/www/html/
WORKDIR /var/www/html/

RUN curl -SOk https://wordpress.org/latest.tar.gz &&\
	tar -xzf latest.tar.gz
COPY .htaccess /var/www/html/wordpress
WORKDIR /var/www/html/wordpress

RUN cp wp-config-sample.php wp-config.php &&\
	mkdir wp-content/upgrade

RUN chown -R www-data:www-data /var/www/html/ &&\
	chmod 660 .htaccess &&\
	find /var/www/html -type d -exec chmod g+s {} \; &&\
	chmod g+w /var/www/html/wordpress/wp-content &&\
	chmod -R g+w /var/www/html/wordpress/wp-content/themes &&\
	chmod -R g+w /var/www/html/wordpress/wp-content/plugins

#RUN curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> salt.list

RUN ls -lah /var/www/html/wordpress
