FROM php:8.0.6-fpm-alpine3.13
ARG ENV_FILE
ENV PHP_EXTRA_CONFIGURE_ARGS \
  --enable-fpm \
  --with-fpm-user=www-data \
  --with-fpm-group=www-data \
  --enable-intl \
  --enable-opcache \
  --enable-zip \
  --enable-calendar

RUN apk update
RUN apk upgrade
RUN apk add wget 
RUN apk add curl
RUN apk add git
RUN apk add bash
RUN apk add nginx openrc
RUN apk add util-linux


RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install exif 
RUN docker-php-ext-install pcntl 
RUN docker-php-ext-install bcmath 

RUN apk add nginx

COPY ./nginx/default.conf /etc/nginx/site-available
COPY ./nginx/default.conf /etc/nginx/site-enabled
COPY ./nginx/nginx.conf /etc/nginx

RUN nginx -t

RUN mkdir /var/www/web
WORKDIR /var/www/web
COPY ./source/ .

#RUN composer install --ignore-platform-reqs
#RUN chown -R www-data:www-data /var/www/xvolve
#RUN php artisan key:generate
#RUN php artisan migrate --seed
#RUN php artisan passport:keys

ADD ./entrypoint.sh ./entrypoint.sh
ADD ./${ENV_FILE} ./.env
RUN tr -d "\015" <entrypoint.sh >Entrypoint.sh
RUN mv ./Entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT /entrypoint.sh