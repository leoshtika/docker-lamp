FROM php:7.2-apache
RUN apt-get update && apt-get install -y \
        git \
        libicu-dev \
        zlib1g-dev \
    && docker-php-ext-install pdo pdo_mysql mysqli intl zip
