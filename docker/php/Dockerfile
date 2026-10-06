FROM php:8.4-fpm-alpine

ARG UID=1000
ARG GID=1000

RUN apk add --no-cache git unzip icu-libs libzip libpng freetype libjpeg-turbo sqlite-libs \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS icu-dev libzip-dev libpng-dev freetype-dev libjpeg-turbo-dev sqlite-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" pdo_sqlite intl zip bcmath opcache pcntl gd \
    && apk del .build-deps

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
COPY php.ini /usr/local/etc/php/conf.d/zz-dev.ini

RUN addgroup -g ${GID} app 2>/dev/null || true \
    && adduser -D -u ${UID} -G "$(getent group ${GID} | cut -d: -f1)" app \
    && sed -i 's/^user = .*/user = app/; s/^group = .*/group = app/' /usr/local/etc/php-fpm.d/www.conf 2>/dev/null || true

WORKDIR /var/www/html
USER app
