FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server

RUN mkdir -p /data \
    && chown -R redis:redis /data

COPY ./conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]