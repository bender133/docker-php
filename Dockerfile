# Используем стабильный PHP 8.3 с FPM
FROM php:8.3-fpm

# Установим системные зависимости и полезные утилиты
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libicu-dev \
    libonig-dev \
    libpng-dev \
    libxml2-dev \
    libpq-dev \
    curl \
    && docker-php-ext-install \
        pdo_pgsql \
        pgsql \
        intl \
        zip \
        opcache \
        bcmath

# Установим и настроим Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Установим Redis расширение
RUN pecl install redis \
    && docker-php-ext-enable redis

# Настройка Xdebug через ini
RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.mode=\${XDEBUG_MODE}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.discover_client_host=true" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Установим Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Укажем рабочую директорию
WORKDIR /var/www

# Используем production ini как основу (можно заменить на development)
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"