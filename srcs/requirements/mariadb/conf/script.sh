# !/bin/bash
service mariadb start
echo "CREATE DATABASE IF NOT EXISTS $MY_DATABASE;" | mysql -u root
echo "CREATE USER '$MY_USER'@'%' IDENTIFIED BY '$MY_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MY_DATABASE.* TO '$MY_USER'@'%';" | mysql -u root
echo "ALTER USER '$MY_ROOT'@'localhost' IDENTIFIED BY '$MY_ROOT_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
kill `cat /var/run/mysqld/mysqld.pid`
mysqld