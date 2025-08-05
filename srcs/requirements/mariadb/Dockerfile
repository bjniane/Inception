FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/lib/mysql \
    /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.cnf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/init-mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-mariadb.sh

ENTRYPOINT ["/usr/local/bin/init-mariadb.sh"]