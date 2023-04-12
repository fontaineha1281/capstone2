#!/bin/bash
echo "Docker Web Server container has been started"
chown -R www-data:www-data /var/www/web
nginx
php-fpm -F
