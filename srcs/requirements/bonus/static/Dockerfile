FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

COPY ./tools/ .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]