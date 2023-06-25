
if [ -d /home/ibenmain/data/mariadb ]; then
    echo "directory exists"
else
    mkdir -p /home/ibenmain/data/mariadb
fi

if [ -d /home/ibenmain/data/wordpress ]; then
    echo "directory exists"
else
    mkdir -p /home/ibenmain/data/wordpress
fi