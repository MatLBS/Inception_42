#!/bin/bash

# echo "Starting MariaDB..."

# mariadbd-safe --datadir=/var/lib/mysql &
# service mysqld start
# sleep 5

# echo "Initialisation de la base de données MariaDB..."

# echo "DEBUGG 1"
# mysqld "CREATE DATABASE IF NOT EXISTS mydb;"
# echo "DEBUGG 2"
# mysqld "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# echo "DEBUGG 3"
# mysqld "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# echo "DEBUGG 4"
# mysqld "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
# echo "DEBUGG 5"
# mysqld "FLUSH PRIVILEGES;"

# mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown
# # service mysqld stop

# echo "La base de données MariaDB est en place !"
# exec mariadbd-safe

# ------------------------------------------

echo "Starting MariaDB..."

mysqld_safe --datadir=/var/lib/mysql &
sleep 5

echo "Initialisation de la base de données MariaDB..."

chmod 750 "/var/lib/mysql"
chown mysql:mysql /var/lib/mysql

mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}' WITH GRANT OPTION;"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown

echo "La base de données MariaDB est en place !"

exec mysqld_safe
