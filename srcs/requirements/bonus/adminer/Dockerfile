FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    php-mbstring \
    curl \
    && mkdir -p /adminer \
    && curl -o /adminer/adminer.php https://www.adminer.org/static/download/5.3.0/adminer-5.3.0.php

RUN mv /adminer/adminer.php /adminer/index.php

WORKDIR /adminer

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000"]
