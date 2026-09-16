#!/bin/bash

set -e

if [ ! -f "/var/www/html/wp-login.php" ]; then
    wp core download \
        --path=/var/www/html \
        --allow-root
fi

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="mariadb:3306" \
        --path=/var/www/html \
        --allow-root
fi

until wp db check \
    --path=/var/www/html \
    --allow-root >/dev/null 2>&1
do
    echo "Waiting for MariaDB..."
    sleep 2
done

if ! wp core is-installed \
    --path=/var/www/html \
    --allow-root >/dev/null 2>&1
then
    wp core install \
        --url="https://${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --path=/var/www/html \
        --allow-root

    wp user create \
        "${WP_USER}" \
        "${WP_USER_EMAIL}" \
        --role=author \
        --user_pass="${WP_USER_PASSWORD}" \
        --path=/var/www/html \
        --allow-root
fi

exec php-fpm8.2 -F
