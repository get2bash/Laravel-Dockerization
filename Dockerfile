FROM php:8.0.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install composer for dependency management
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Give ownership of the application files to the web server user
RUN chown -R www-data:www-data /var/www

# Set the proper permissions for the application directories
RUN find /var/www -type d -exec chmod 755 {} \;

# Set the proper permissions for the application files
RUN find /var/www -type f -exec chmod 644 {} \;

# Set working directory
WORKDIR /var/www