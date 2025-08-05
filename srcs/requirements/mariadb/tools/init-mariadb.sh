#!/bin/sh

if [ ! -f "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB server in background
mysqld --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0 &
MYSQLD_PID=$!

# Wait until MariaDB is ready
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

# Run setup queries
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Stop background MariaDB
mysqladmin shutdown
 
exec mysqld --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0