#!/bin/bash

echo "Démarrage du script pour initialiser la base de données MariaDB..."

service mariadb start;

mariadb -u root

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"

mariadb -e "USE ${MARIADB_DATABASE}";

mariadb -e "CREATE OR REPLACE USER \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -e "CREATE OR REPLACE USER \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

mariadb -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

mariadb -e "FLUSH ${MARIADB_DATABASE};"

mariadb -e "EXIT;"

# mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress;"

# mariadb -e "USE wordpress";

# mariadb -e "CREATE OR REPLACE USER 'wp_user'@'localhost' IDENTIFIED BY wp_password;"
# mariadb -e "CREATE OR REPLACE USER 'wp_user'@'%' IDENTIFIED BY wp_password;"

# mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'localhost';"
# mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'%';"

# mariadb -e "FLUSH wordpress;"

# mariadb -e "EXIT;"0