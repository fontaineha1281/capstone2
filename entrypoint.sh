#!/bin/bash
echo "Docker container has been started"
composer install --ignore-platform-reqs
chown -R www-data:www-data /var/www/web
touch /var/log/cron.log
chown www-data:www-data /var/log/cron.log
nginx
php-fpm -F

# Setup a cron schedule
echo "SHELL=/bin/bash
* * * * * su www-data -c \"/run_schedule.sh\" -s /bin/bash www-data
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron 
tail -f /var/www/web/storage/logs/laravel*
