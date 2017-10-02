FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -y install python-software-properties git build-essential \
    && apt-get install -y curl \
    && apt-get -y autoclean

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
