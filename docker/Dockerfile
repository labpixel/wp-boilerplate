FROM wordpress:6.1.1-php8.1-fpm

COPY docker/templates/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /var/www/html/web