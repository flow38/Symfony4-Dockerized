# See https://github.com/docker-library/php/blob/master/7.1/fpm/Dockerfile
#FROM php:7.2.0-fpm-stretch
FROM php:7.1-fpm
ARG TIMEZONE

MAINTAINER Maxence POUTORD <maxence.poutord@gmail.com>


RUN apt-get update && apt-get install -y \
    dialog \
    openssl \
    git \
    unzip \
    apt-utils \
    libpng-dev    

#If you want install nodejs, npm & yarn
#RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
#RUN    apt-get install -y nodejs 
#RUN   npm install -g yarn  
#RUN yarn add sass-loader node-sass webpack-notifier jquery --dev
    
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
&&  printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
&&  "date"

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql gd

#Install wget
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget \
&& wget -O - https://packagecloud.io/gpg.key | apt-key add - \
&& echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list

RUN docker-php-ext-install opcache \
&& docker-php-ext-enable opcache

# install xdebug 
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug



RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#&& echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& alias sf="php /var/www/symfony/bin/console"

WORKDIR /var/www/symfony


