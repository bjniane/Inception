FROM debian:bullseye

RUN apt-get update && apt-get install -y curl

WORKDIR /data

RUN curl -L "https://github.com/portainer/portainer/releases/download/2.27.9/portainer-2.27.9-linux-amd64.tar.gz" -o portainer.tar.gz \
    && tar xzvf portainer.tar.gz \
    && rm -rf portainer.tar.gz

EXPOSE 9000

CMD ["./portainer/portainer"]