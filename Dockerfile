FROM nginx:1.11

RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-enabled/default

# expose both the HTTP (80)
EXPOSE 80

CMD ["nginx"]
