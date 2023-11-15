#!/bin/bash

# Create directories
mkdir -p /var/www/html

# Navigate to the HTML directory
cd /var/www/html

# Remove existing files
rm -rf *

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# Make it executable and move to /usr/local/bin
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress core
wp core download --allow-root

# Move wp-config sample to wp-config
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Replace placeholders in wp-config.php
sed -i -r "s/db1/$db_name/1; s/user/$db_user/1; s/pwd/$db_pwd/1" wp-config.php

# Install WordPress
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# Create a new user
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

# Install and activate the Astra theme
wp theme install astra --activate --allow-root

# Install and activate the Redis Cache plugin
wp plugin install redis-cache --activate --allow-root

# Update all plugins
wp plugin update --all --allow-root

# Update PHP-FPM configuration
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# Create a directory for PHP
mkdir -p /run/php

# Enable Redis caching
wp redis enable --allow-root

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F