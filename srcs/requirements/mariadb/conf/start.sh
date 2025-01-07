#!/bin/bash

echo "Starting MariaDB..."

mariadbd-safe --datadir=/var/lib/mysql &
# service mysqld start
sleep 5

echo "Initialisation de la base de données MariaDB..."

mysqld "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mysqld "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysqld "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysqld "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysqld "FLUSH PRIVILEGES;"

mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown
# service mysqld stop

echo "La base de données MariaDB est en place !"
exec mariadbd-safe
    
# ----------------------------------------------------

# echo "Initialisation de la base de données MariaDB..."

# mysql -e "CREATE DATABASE IF NOT EXISTS mydb;"
# mysql -e "CREATE USER IF NOT EXISTS 'myuser'@'localhost' IDENTIFIED BY 'password';"
# mysql -e "GRANT ALL PRIVILEGES ON 'mydb' TO 'myuser'@'%' IDENTIFIED BY 'password';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpassword';"
# mysql -e "FLUSH PRIVILEGES;"

# mysqladmin -u root -p shutdown

# echo "La base de données MariaDB est en place !"
# exec mysqld_safe