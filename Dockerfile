FROM ubuntu:20.04

# Install Nginx, Supervisor, MySQL client, PHP-FPM, and PHP MySQL extensions
RUN apt-get update && apt-get install -y nginx supervisor mysql-client php-fpm php-mysql \
    && mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/http.d/default.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY index.php /var/www/html/index.php

WORKDIR /var/www/html
EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
