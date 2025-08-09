FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    php-mbstring \
    curl \
    && curl -o /var/www/html/adminer.php https://www.adminer.org/static/download/5.3.0/adminer-5.3.0.php
