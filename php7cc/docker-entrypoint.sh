#!/bin/sh
set -e

if [ "$1" == "php7cc" ]; then
    exec php -d memory_limit=2G /composer/vendor/bin/"$@"
fi

if [ "$1" == "bash" ]; then
    exec /bin/ash
fi

exec "$@"