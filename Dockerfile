FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    libgd-dev \
    libzip-dev \
    zip \
    && docker-php-ext-install gd zip \
    && rm -rf /var/lib/apt/lists/*

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html/qrcodes \
    && chmod -R 755 /var/www/html/qrcodes

EXPOSE 80
