FROM php:7.1-alpine

MAINTAINER Karel Wintersky <karel.wintersky@gmail.com>

ENV COMPOSER_HOME /composer
ENV PATH "/composer/vendor/bin:$PATH"

WORKDIR /app

RUN apk --no-cache add git curl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer \
    && echo "date.timezone = Europe/Moscow" >> /usr/local/etc/php/conf.d/symfony.ini \
    && composer global require sstalle/php7cc \
    && rm /usr/local/bin/composer \
    && apk --no-cache del git curl -r


COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["php7cc","-h"]
