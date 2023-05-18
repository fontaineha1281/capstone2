#!/bin/bash
echo "Docker Web Server container has been started"
chown -R www-data:www-data /var/www/html
nginx
service php8.0-fpm start

# Giữ container chạy
tail -f /dev/null
