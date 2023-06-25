FROM debian:bullseye
RUN apt-get update && apt-get install mariadb-server mariadb-client -y
RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
CMD ["bash", "/tmp/script.sh"]