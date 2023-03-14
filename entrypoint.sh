#!/bin/bash
echo "Docker container has been started"
chown -R www-data:www-data /var/www/web
touch /var/log/cron.log
chown www-data:www-data /var/log/cron.log
nginx
php-fpm -F

