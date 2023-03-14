#!/bin/bash
echo "Docker container has been started"
chown -R www-data:www-data /var/www/web
nginx
