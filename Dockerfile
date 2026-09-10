FROM ubuntu:24.04
LABEL description="fcv devops application on Ubuntu 24.04"

# Install Apache, MySQL client, and PHP MySQL support
RUN apt update && \
    apt install -y apache2 mysql-client libapache2-mod-php php-mysql && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY index.php /var/www/html/index.php


EXPOSE 80

RUN echo "Test web application" > /var/www/html/index.html
RUN echo "health-ok" > /var/www/html/healthz

CMD ["apache2ctl", "-D", "FOREGROUND"]