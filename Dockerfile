FROM ubuntu:22.04
LABEL description="fcv devops application on Ubuntu 22.04"

# Install Apache, MySQL client, and PHP MySQL support
RUN apt-get update && apt-get install -y apache2 mysql-client libapache2-mod-php php-mysql \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY index.php /var/www/html/index.php


EXPOSE 80

RUN echo "Test web application" > /var/www/html/index.html
RUN echo "health-ok" > /var/www/html/healthz

CMD ["apache2ctl", "-D", "FOREGROUND"]