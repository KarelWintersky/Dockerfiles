FROM alpine
MAINTAINER Guilherme Thomazi Bonicontro <thomazi@linux.com>
MAINTAINER Karel Wintersky <karel.wintersky@gmail.com>

ENV FASM_VERSION 1.73.04

RUN apk add --no-cache curl && \
    curl -sL "https://flatassembler.net/fasm-$FASM_VERSION.tgz" | tar xz && \
    ln -s /fasm/fasm /bin/fasm

