FROM php:8.2-apache

# Get user id and group id from arguments
ARG UID
ARG GID

# Get the upload related arguments
ARG UPLOAD_LIMIT
ARG MEMORY_LIMIT
ARG MAX_EXECUTION_TIME

# Update
RUN apt-get -y update --fix-missing && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends install -y apt-utils && \
    rm -rf /var/lib/apt/lists/*

# Install useful tools and important libaries
RUN apt-get -y update && \
    apt-get -y --no-install-recommends install nano wget \
      dialog \
      libsqlite3-dev \
      libsqlite3-0 && \
    apt-get -y --no-install-recommends install default-mysql-client \
      zlib1g-dev \
      libzip-dev \
      libicu-dev && \
    apt-get -y --no-install-recommends install --fix-missing apt-utils \
      build-essential \
      git \
      curl \
      libonig-dev && \
    apt-get -y --no-install-recommends install --fix-missing libcurl4 \
      libcurl4-openssl-dev \
      zip \
      openssl && \
    rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:2.2 /usr/bin/composer /usr/local/bin/composer

# Install xdebug
RUN pecl install xdebug-3.2.0 && \
    docker-php-ext-enable xdebug

# Other PHP8 Extensions
RUN docker-php-ext-install pdo_mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install zip && \
    docker-php-ext-install -j$(nproc) intl && \
    docker-php-ext-install gettext

# Create an uploads related configuration file
ARG UPLOAD_CONFIG_PATH=/usr/local/etc/php/conf.d/uploads.ini
RUN touch ${UPLOAD_CONFIG_PATH} \
    && echo "upload_max_filesize = ${UPLOAD_LIMIT}" >> ${UPLOAD_CONFIG_PATH} \
    && echo "post_max_size = ${UPLOAD_LIMIT}" >> ${UPLOAD_CONFIG_PATH} \
    && echo "max_execution_time = ${MAX_EXECUTION_TIME}" >> ${UPLOAD_CONFIG_PATH} \
    && echo "memory_limit = ${MEMORY_LIMIT}" >> ${UPLOAD_CONFIG_PATH}

# Install Freetype
RUN apt-get -y update && \
    apt-get --no-install-recommends install -y libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure gd --with-jpeg --with-freetype && \
    docker-php-ext-install gd

# Install Imagick
RUN apt-get -y update && \
    apt-get --no-install-recommends install -y libmagickwand-dev && \
    rm -rf /var/lib/apt/lists/* && \
    pecl install imagick && \
    docker-php-ext-enable imagick

# Enable apache modules
RUN a2enmod rewrite headers

# Add /vendor/bin/ to path (for codecept, phpunit, etc...)
ENV PATH="/var/www/html/vendor/bin:$PATH"

# Cleanup
RUN rm -rf /usr/src/*

# Fix permission issues
# Create a non-root user called 'myuser' in container and set the user id and group id same as host's
RUN if [ ! $(getent group ${GID}) ]; then \
        addgroup --gid ${GID} myuser; \
    fi
RUN adduser --disabled-password --gecos '' --uid ${UID} --gid ${GID} myuser

# This section should be always in the end of this file
USER myuser