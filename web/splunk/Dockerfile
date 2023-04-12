# Sử dụng hình ảnh cơ sở là hình ảnh Ubuntu 18.04
FROM ubuntu:20.04

# Thiết lập biến môi trường
ENV SPLUNK_VERSION=9.0.4.1 \
    SPLUNK_BUILD=419ad9369127 \
    SPLUNK_HOME=/opt/splunk \
    SPLUNK_USER=splunk \
    SPLUNK_GROUP=splunk

# Cài đặt các gói ph thuộc cần thiết
RUN apt-get update && \ 
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:ondrej/php -y && \
    apt-get install php8.0 php8.0-mbstring php8.0-gettext php8.0-zip php8.0-fpm php8.0-curl php8.0-mysql php8.0-gd php8.0-cgi php8.0-soap php8.0-sqlite3 php8.0-xml php8.0-redis php8.0-bcmath php8.0-imagick        php8.0-intl -y && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Tải xuống và cài đặt Splunk
RUN wget -O splunk.deb "https://download.splunk.com/products/splunk/releases/9.0.4.1/linux/splunk-9.0.4.1-419ad9369127-linux-2.6-amd64.deb" \
    && dpkg -i splunk.deb \
    && rm -f splunk.deb

# Cấu hình Splunk
COPY ./splunk-launch.conf ${SPLUNK_HOME}/etc/splunk-launch.conf
COPY ./user-seed.conf ${SPLUNK_HOME}/etc/system/local/user-seed.conf
COPY ./splunk-start.sh /splunk-start.sh
RUN chmod +x 

# Thiết lập quyền thích hợp cho Splunk
RUN chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} ${SPLUNK_HOME}

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx

COPY ./source/ /var/www/html

#Change Own Directory
RUN chown www-data -R /var/www/html

# Config Nginx
COPY default.conf /etc/nginx/sites-available/default
COPY default.conf /etc/nginx/sites-enabled/default

ADD ./entrypoint.sh ./entrypoint.sh
RUN tr -d "\015" <entrypoint.sh >Entrypoint.sh
RUN mv ./Entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run Nginx and PHP-FPM
ENTRYPOINT /entrypoint.sh

