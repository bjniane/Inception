FROM debian:bullseye

WORKDIR /adminer

RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    php-mbstring \
    curl \
    && curl -o adminer.php https://www.adminer.org/static/download/5.3.0/adminer-5.3.0.php

RUN mv adminer.php index.php

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000"]
