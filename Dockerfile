FROM php:8.3-apache

LABEL description="fcv devops PHP application"

# Install PHP MySQL extension
RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy application
COPY index.php /var/www/html/index.php

# Health check file
RUN echo "health-ok" > /var/www/html/healthz

USER www-data

WORKDIR /var/www/html
EXPOSE 80
CMD ["apache2-foreground"]
