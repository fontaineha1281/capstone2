FROM ubuntu:20.04

#Install Repo and PHP
RUN apt-get update && \ 
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get install php8.0 php8.0-mbstring php8.0-gettext php8.0-zip php8.0-fpm php8.0-curl php8.0-mysql php8.0-gd php8.0-cgi php8.0-soap php8.0-sqlite3 php8.0-xml php8.0-redis php8.0-bcmath php8.0-imagick php8.0-intl -y

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx

# Creata Directory
RUN mkdir -p /var/www/html

# Copy Source to NGINX
COPY ./source/ /var/www/html


# Config Nginx
COPY ./nginx/default.conf /etc/nginx/sites-available/default
COPY ./nginx/default.conf /etc/nginx/sites-enabled/default

# Run Nginx and PHP-FPM
ENTRYPOINT /entrypoint.sh

