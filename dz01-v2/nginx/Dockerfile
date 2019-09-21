FROM ubuntu
MAINTAINER Vadim Bykau <vadim.bykau@silkdata.ai>
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y &&\
        apt-get install -y nginx curl

COPY wordpress.conf /etc/nginx/sites-available/wordpress.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/wordpress.conf &&\
	unlink /etc/nginx/sites-enabled/default
RUN nginx -t &&\
	/etc/init.d/nginx restart

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
