FROM php:8.1.0-apache

WORKDIR /var/www/html

# Mod Rewrite
RUN a2enmod rewrite

# Linux Library
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev 

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# PHP Extension
RUN docker-php-ext-install gettext intl pdo_mysql gd

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Give ownership of the application files to the web server user
RUN chown -R www-data:www-data /var/www/html

# Set the proper permissions for the application directories
RUN find /var/www/html -type d -exec chmod 755 {} \;

# Set the proper permissions for the application files
RUN find /var/www/html -type f -exec chmod 644 {} \;
