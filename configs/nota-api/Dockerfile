FROM php:8.0-apache

RUN apt-get update && apt-get install -y \
        libpq-dev \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql opcache zip mbstring \
    && docker-php-source delete 


WORKDIR /var/www/html

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer

COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite