# PHP 7 Compatibility Checker (php7cc)

Copied from https://github.com/sstalle/php7cc

#### Introduction

php7cc is a command line tool designed to make migration from PHP 5.3-5.6 to PHP 7 easier. It searches for potentially troublesome statements in existing code and generates reports containing file names, line numbers and short problem descriptions. It does not automatically fix code to work with the new PHP version.

# Устанавливаем

```
docker build --compress --tag blacktower/php7cc https://github.com/KarelWintersky/Dockerfiles.git#master:php7cc
```

# Запускаем проверку

По ряду причин (изолированность докер-контейнера) нельзя проверить произвольную директорию, только текущую (она пробрасывается внутрь контейнера при помощи `-v $(pwd):/app`.

Ключи запуска:

	docker run -it --rm -v $(pwd):/app blacktower/php7cc

Проверка всех файлов в текущем каталоге:

	docker run -it --rm -v $(pwd):/app blacktower/php7cc php7cc .

# Отладка

	docker run -it --rm -v $(pwd):/app blacktower/php7cc bash

Позволяет войти внутрь контейнера и запустить проверку с какими-то специфическими ключами. Команда 

	/app # php7cc .

делает действия по умолчанию. То есть аналогична дефолтному вызову контейнера.