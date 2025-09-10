# Use official PHP Apache image
FROM php:8.4-apache

# Install necessary extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable mysqli pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Change ownership for Apache
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80
