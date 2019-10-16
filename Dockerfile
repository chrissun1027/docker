FROM php:7.2-apache

MAINTAINER Ulysse ARNAUD "ulysse.arnaud@liigem.io"

RUN docker-php-ext-install pdo_mysql

RUN apt-get update
RUN apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git

RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -

ENV PATH /usr/local/go/bin:$PATH

RUN go get github.com/mailhog/mhsendmail

RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail

RUN echo 'sendmail_path = /usr/bin/mhsendmail --smtp-addr mailhog:1025' > /usr/local/etc/php/php.ini
