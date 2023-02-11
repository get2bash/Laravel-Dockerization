# Use the official image for the latest version of Ubuntu
FROM php:8.2.2-apache-bullseye

# Set the working directory in the container to /var/www/html
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

RUN apk add --no-cache \
    build-base \
    autoconf \
    pcre-dev \
    zlib-dev \
    libmemcached-dev \
    cyrus-sasl-dev \
    git

# install extensions
RUN docker-php-ext-install pdo_mysql && \
    pecl install memcached && \
    docker-php-ext-enable memcached
# Copy the Laravel application files to the container
COPY . /var/www/html

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install composer for dependency management
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Give ownership of the application files to the web server user
RUN chown -R www-data:www-data /var/www/html \
    sudo chown -R $USER:$USER ~/laravel-app

# Set the proper permissions for the application directories
RUN find /var/www/html -type d -exec chmod 755 {} \;

# Set the proper permissions for the application files
RUN find /var/www/html -type f -exec chmod 644 {} \;

# Create the Apache virtual host configuration file
COPY virtualhost.conf /etc/apache2/sites-available/000-default.conf

# Copy the environment variable file
COPY .var /var/www/html/Laravel

# Enable the virtual host and the mod_rewrite module
RUN a2ensite 000-default.conf && a2enmod rewrite

CMD ["php-fpm"]