FROM php:8-apache

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli pdo pdo_mysql

RUN a2enmod rewrite

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl && docker-php-ext-install intl && docker-php-ext-enable intl