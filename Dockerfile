FROM nginx:1.12

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-enabled/default

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install gnupg \
    && apt-get -y autoclean
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

EXPOSE 80
