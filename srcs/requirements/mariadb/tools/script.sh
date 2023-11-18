#!/bin/bash



service mysql start 
echo "CREATE DATABASE IF NOT EXISTS $debian_name ;" > debian.sql
echo "CREATE USER IF NOT EXISTS '$debian_client'@'%' IDENTIFIED BY '$debian_pwd' ;" >> debian.sql
echo "GRANT ALL PRIVILEGES ON $debian_name.* TO '$debian_client'@'%' ;" >> debian.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> debian.sql
echo "FLUSH PRIVILEGES;" >> debian.sql

mysql < debian.sql

service mysql stop

mysqld
