FROM ubuntu:24.04
LABEL description="fcv devops application on Ubuntu 24.04"

# Install Apache, MySQL client, and PHP MySQL support
RUN apt-get update && \
    apt-get install -y apache2 mysql-client libapache2-mod-php php-mysql netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

WORKDIR /var/www/html
COPY index.php .
RUN rm -rf index.html

RUN echo "health-ok" > /var/www/html/healthz

# USER www-data

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
