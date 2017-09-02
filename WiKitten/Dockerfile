FROM php:7.1-alpine

MAINTAINER Karel Wintersky <karel.wintersky@gmail.com>

EXPOSE 9000

ENV \
	GIT_REPO="https://github.com/noahfrederick/Wikitten.git" \
	WORKING_DIR="/var/www"

RUN apk --update add git \
	&& mkdir -p /var/www \
	&& git clone "${GIT_REPO}" ${WORKING_DIR} \
	&& apk del git \
	&& rm -rf /var/cache/apk/*

WORKDIR /var/www

CMD [ "php", "-S", "0.0.0.0:9000", "routing.php" ]
