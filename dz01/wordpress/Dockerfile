FROM httpd:2.4

RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y curl php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc
#get latest wordpress
WORKDIR /usr/local/apache2/htdocs/

RUN curl -SOk https://wordpress.org/latest.tar.gz &&\
	tar -xzf latest.tar.gz --strip 1 &&\
	chmod 660 .htaccess &&\
	cp wp-config-sample.php wp-config.php &&\
	mkdir wp-content/upgrade

RUN ls -ll /usr/local/apache2/htdocs/
