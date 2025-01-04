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

echo "Démarrage du service MariaDB..."
service mariadb start;

echo "Initialisation de la base de données MariaDB..."
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown
exec mysqld_safe

echo "La base de données MariaDB est en place !"

# ------------------------------------------------------------


# mariadb -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'mot_de_passe';"
# mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;"
# mariadb -e "FLUSH PRIVILEGES;"