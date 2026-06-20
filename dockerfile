FROM php:8.3-apache

RUN docker-php-ext-install pdo pdo_mysql
RUN a2enmod rewrite

RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

USER root

RUN mkdir -p /var/www/html/uploads/pfp/

RUN chown -R www-data:www-data /var/www/html/uploads/
RUN chmod -R 755 /var/www/html/uploads/