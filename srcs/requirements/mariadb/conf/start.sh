#!/bin/bash

# echo "Démarrage du script pour initialiser la base de données MariaDB..."

# service mariadb start;

# mariadb -u root

# mariadb -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"

# mariadb -e "USE ${MARIADB_DATABASE}";

# mariadb -e "CREATE OR REPLACE USER '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# mariadb -e "CREATE OR REPLACE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

# mariadb -e "GRANT ALL PRIVILEGES ON *'${MARIADB_DATABASE}'.* TO '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# mariadb -e "GRANT ALL PRIVILEGES ON *'${MARIADB_DATABASE}'.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

# mariadb -e "FLUSH ${MARIADB_DATABASE};"

# mariadb -e "EXIT;"

# -------------------------------------------------------------

echo "Starting MariaDB..."
# service mariadb start
sleep 5

echo "Initialisation de la base de données MariaDB..."

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p shutdown

# service mariadb stop;
echo "La base de données MariaDB est en place !"
# exec mysqld_safe

# ------------------------------------------------------------