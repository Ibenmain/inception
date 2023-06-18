FROM debian:bullseye
RUN apt-get update && apt-get install -y curl php-mysql php7.4 php7.4-fpm
COPY ./conf/script_wp.sh /tmp/script_wp.sh
RUN chmod +x /tmp/script_wp.sh
CMD ["bash", "./tmp/script_wp.sh"]
