FROM php:7-apache

RUN apt-get update \
    && apt-get install -y \
		wget unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        sqlite3 libsqlite3-dev \
        libssl-dev \
    && pecl install mongodb \
    && pecl install redis \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) iconv gd pdo opcache pdo_sqlite \
    && a2enmod rewrite expires

RUN echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongodb.ini
RUN echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

RUN wget https://github.com/agentejo/cockpit/archive/master.zip -O /var/www/html/cockpit.zip; unzip /var/www/html/cockpit.zip -d /var/www/html/; rm /var/www/html/cockpit.zip
RUN mv /var/www/html/cockpit-master/.htaccess /var/www/html/.htaccess
RUN mv /var/www/html/cockpit-master/* /var/www/html/
RUN rm -R /var/www/html/cockpit-master/

COPY src /var/www/html/

RUN chown -R www-data:www-data storage
RUN chown -R www-data:www-data config

VOLUME /var/www/html/storage
