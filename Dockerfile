FROM ubuntu:24.04
LABEL description="fcv devops application on Ubuntu 24.04"

# Install Apache, MySQL client, and PHP MySQL support
RUN apt update && \
    apt install -y apache2 mysql-client libapache2-mod-php php-mysql && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY index.php /var/www/html/index.php

RUN echo "health-ok" > /var/www/html/healthz

WORKDIR /var/www/html

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]