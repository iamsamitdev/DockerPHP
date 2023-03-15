# load php 8.2 base image
FROM php:8.2-fpm-buster

# install dependencies
RUN docker-php-ext-install pdo_mysql bcmath

# update image
RUN apt-get update
RUN apt-get install -y git zip unzip

# Copy file composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Expose port 9000
EXPOSE 9000