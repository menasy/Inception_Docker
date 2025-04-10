#!/bin/sh
set -e

DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
DB_USER=$(cat /run/secrets/db_user)
DB_PASSWORD=$(cat /run/secrets/db_password)

service mariadb start

until mysqladmin ping -h "localhost" --silent; do
    echo "MariaDB is starting..."
    echo "Waiting"
done

mysql -uroot -p"${DB_ROOT_PASSWORD}" <<-EOSQL
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
    GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
EOSQL

service mariadb stop

exec mysqld
