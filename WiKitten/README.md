# WiKitten

- Base repo: https://github.com/victorstanciu/Wikitten/
- Latest repo: https://github.com/noahfrederick/Wikitten/
- From WiKitten WIKI: 
- - https://github.com/victorstanciu/Wikitten/wiki/nginx-configuration
- - https://github.com/victorstanciu/Wikitten/wiki/Docker-instructions (на всякий случай)
- Демо: https://wikitten.vizuina.com/index.md

В репозитории есть dockerfile на базе php:5.6-cli (который сделан в свою очередь на базе `debian:jessie`). Я сделал свою версию - на базе `php:7.1-alpine`.

# Установка

## Собираем локальный репо

	docker build --compress --no-cache --tag blacktower/wikitten https://github.com/KarelWintersky/Dockerfiles.git#master:WiKitten

## Запускаем

	docker run -d --name=wikitten -p 8085:9000 -v /srv/docker/docker.appdata/wikitten:/var/www/library blacktower/wikitten

Ошибка: `You're looking at this page because you haven't created a /var/www/library/index.md file yet.` чинится выкладываением в `/srv/docker/docker.appdata/wikitten` файлика `index.md`

- `/srv/docker.appdata/wikitten` - внешний volume с данными WiKitten (в папке должен быть как минимум файл index.md)
- `8085` - порт на хосте

## Использование внешнего конфига (изменяем настройки WiKitten)

```
docker run -d --name=wikitten -p 8085:9000 -v /srv/docker/docker.appdata/wikitten:/var/www/library -v /srv/docker/docker.appdata/wikitten.conf:/var/www/config.php blacktower/wikitten
```

Файл должен иметь следующий вид (нужные строчки раскомментировать):

```
<?php
// Configuration file for Wikitten. 

// Custom name for your wiki:
define('APP_NAME', 'My Wiki');

// Set the filename of the automatic homepage here
define('DEFAULT_FILE', 'index.md');

// Custom path to your wiki's library:
// define('LIBRARY', '/path/to/wiki/library');

// Enable editing files through the interface?
// NOTE: There's currently no authentication built into Wikitten, controlling
// who does what is your responsibility.
// define('ENABLE_EDITING', true);

// Enable JSON page data?
// define('USE_PAGE_METADATA', true);

// Enable the dark theme here
// define('USE_DARK_THEME', true);

// Disable the Wikitten logo here
// define('USE_WIKITTEN_LOGO', false);

// Enable PasteBin plugin ?
// define('ENABLE_PASTEBIN', true);
// define('PASTEBIN_API_KEY', '');
```



# Примечания

С nginx'ами и прочими радостями жизни может понадобиться другая настройка.

Без докера WiKitten тоже работает прекрасно - нужен php, apache/nginx и виртуальный хост. 



