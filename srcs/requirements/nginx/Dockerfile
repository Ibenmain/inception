FROM debian:bullseye
WORKDIR /etc/nginx
RUN apt-get update && apt-get -y install nginx openssl && openssl req -newkey rsa:4096  -x509  -sha512  -days 365 -nodes -out /etc/ssl/certificate.crt -keyout /etc/ssl/private.key -subj "/C=MA/ST=KH/L=khouribga/O=1337/OU=Org/CN=www.1337.ma"
EXPOSE 443
COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
CMD ["nginx", "-g", "daemon off;"]