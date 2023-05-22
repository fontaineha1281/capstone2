# Sử dụng hình ảnh cơ sở là hình ảnh Ubuntu 18.04
FROM ubuntu:20.04

# Cài đặt các gói ph thuộc cần thiết
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget \ 
    curl \
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update && \ 
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get install php8.0 php8.0-mbstring php8.0-gettext php8.0-zip php8.0-fpm php8.0-curl php8.0-mysql php8.0-gd php8.0-cgi php8.0-soap php8.0-sqlite3 php8.0-xml php8.0-redis php8.0-bcmath php8.0-imagick php8.0-intl -y

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx

COPY ./source/ /var/www/html

#Change Own Directory
RUN chown www-data -R /var/www/html

# Config Nginx
COPY /nginx/default.conf /etc/nginx/sites-available/default
COPY /nginx/default.conf /etc/nginx/sites-enabled/default

COPY /php.ini /etc/php/8.0/fpm/php.ini

ADD ./entrypoint.sh ./entrypoint.sh
RUN tr -d "\015" <entrypoint.sh >Entrypoint.sh
RUN mv ./Entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run Nginx and PHP-FPM
ENTRYPOINT /entrypoint.sh

