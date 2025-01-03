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

service mariadb start;

mariadb -u root

mariadb -e "CREATE DATABASE IF NOT EXISTS mydb;"

mariadb -e "USE mydb";

mariadb -e "CREATE OR REPLACE USER 'myuser'@'localhost' IDENTIFIED BY 'complexpassword';"
mariadb -e "CREATE OR REPLACE USER 'myuser'@'%' IDENTIFIED BY 'complexpassword';"

mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'localhost' IDENTIFIED BY 'complexpassword';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%' IDENTIFIED BY 'complexpassword';"

mariadb -e "FLUSH PRIVILEGES;"

# ------------------------------------------------------------


# mariadb -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'mot_de_passe';"
# mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;"
# mariadb -e "FLUSH PRIVILEGES;"