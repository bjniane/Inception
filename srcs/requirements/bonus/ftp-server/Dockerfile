FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./tools/init-ftp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-ftp.sh

EXPOSE 21 30000-30009

CMD ["/usr/local/bin/init-ftp.sh"]