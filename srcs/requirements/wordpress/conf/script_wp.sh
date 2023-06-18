#!/bin/bash
mkdir -p /run/php
#--WP_CLI : est un ensemble d’outils en ligne de commande pour gérer vos installations WordPress.
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www/html
wp core download --allow-root --path=/var/www/html
# chown -R www-data:www-data /var/www/html
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
chmod -R 0777 /var/www/html/wp-content
# change is modifying the unix socket used for the connection of PHP-FPM with the web server,
# from the default /run/php/php7.3-fpm.sock to TCP/IP port 9000 .
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
wp config set DB_NAME $MY_DATABASE --path=/var/www/html --allow-root
wp config set DB_USER $MY_USER --path=/var/www/html --allow-root
wp config set DB_PASSWORD $MY_PASSWORD --path=/var/www/html --allow-root
wp core install --allow-root --path=/var/www/html --url=example.com --title="My Website" --admin_user="ibenmain" --admin_password="1234" --admin_email="ibenmain92@gmail.com" --skip-email
wp user create --allow-root --path=/var/www/html negan negan2011@gmail.com --role="boss" --user_pass="1234"
/usr/sbin/php-fpm7.4 -F