FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-cli \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    php7.4-xdebug \
    php7.4-bcmath \
    php7.4-opcache \
    php7.4-intl \
    php7.4-soap \
    php7.4-xmlrpc \
    php7.4-imagick \
    curl \
    wget \
    mariadb-client \
    unzip \
    php7.4-redis

RUN mkdir -p /run/php /var/www/html \
    && chown -R www-data:www-data /run/php /var/www/html \
    && chmod 755 /run/php /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/init-wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-wordpress.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/init-wordpress.sh"]