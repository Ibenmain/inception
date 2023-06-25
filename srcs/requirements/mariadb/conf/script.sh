service mariadb start

mysql -u root << END
CREATE DATABASE IF NOT EXISTS $MY_DATABASE;
CREATE USER IF NOT EXISTS '$MY_USER'@'%' IDENTIFIED BY '$MY_PASSWORD';
GRANT ALL PRIVILEGES ON $MY_DATABASE.* TO '$MY_USER'@'%';
FLUSH PRIVILEGES;
END
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MY_ROOT_PASSWORD';

service mariadb stop
mysqld