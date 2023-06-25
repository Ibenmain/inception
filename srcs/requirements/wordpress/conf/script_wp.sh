
sleep 20
mkdir -p /run/php
#--WP_CLI : est un ensemble d’outils en ligne de commande pour gérer vos installations WordPress.
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www/
chown -R www-data:www-data /var/www/
chmod 777 /var/www/
wp core download --allow-root --path=/var/www/
cp /var/www/wp-config-sample.php /var/www/wp-config.php
chmod -R 0777 /var/www/wp-content
# change is modifying the unix socket used for the connection of PHP-FPM with the web server,
# from the default /run/php/php7.3-fpm.sock to TCP/IP port 9000 .
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
wp config set DB_NAME $MY_DATABASE --path=/var/www/ --allow-root
wp config set DB_USER $MY_USER --path=/var/www/ --allow-root
wp config set DB_PASSWORD $MY_PASSWORD --path=/var/www/ --allow-root
wp config set DB_HOST $MY_HOST --path=/var/www/ --allow-root
wp core install --allow-root --path=/var/www/ --url="https://ibenmain.42.fr" --title=$MY_TITLE --admin_user=$USER_ADMIN --admin_password=$PASSWORD_ADMIN --admin_email=$EMAIL_ADMIN --skip-email
wp user create --allow-root --path=/var/www/ negan negan2011@gmail.com --role=$ROOL --user_pass=$USER_PASSWORD
/usr/sbin/php-fpm7.4 -F