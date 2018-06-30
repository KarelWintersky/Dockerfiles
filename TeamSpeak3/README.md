# Build 

## Из докер-файла

	git clone https://github.com/KarelWintersky/Dockerfiles.git
	cd Dockerfiles/Teamspeak/latest
	docker build --compress --no-cache --tag blacktower/ts3server-alpine-sqlite .

## Из репозитория 

	docker build --compress --no-cache --tag blacktower/ts3server-alpine-sqlite https://github.com/KarelWintersky/Dockerfiles.git#master:TeamSpeak3/latest

# Подготовка каталогов

```
export TSDATA=/srv/docker/docker.appdata/teamspeak3
sudo mkdir -p ${TSDATA}
sudo mkdir -p ${TSDATA}/logs
sudo touch ${TSDATA}/ts3server.sqlitedb
```
Примечание: если пытались запускать до этого - все файлы надо будет удалить (`sudo rm -rf ${TSDATA} *`)

# Запуск

```
docker run \ 
-d \
-p 9987:9987/udp -p 10011:10011 -p 30033:30033 \
--name teamspeak \ 
-v /srv/docker/docker.appdata/teamspeak3:/data \ 
-v /srv/docker/docker.appdata/teamspeak3/ts3server.sqlitedb:/opt/teamspeak/ts3server.sqlitedb \
blacktower/ts3server-alpine-sqlite
logpath=/data/logs/ \ 
query_ip_whitelist=/data/query_ip_whitelist.txt \ 
query_ip_blacklist=/data/query_ip_blacklist.txt
```

Или, в одну строчку:
```
docker run -d -p 9987:9987/udp -p 10011:10011 -p 30033:30033 --name teamspeak -v /srv/docker/docker.appdata/teamspeak3:/data -v /srv/docker/docker.appdata/teamspeak3/ts3server.sqlitedb:/opt/teamspeak/ts3server.sqlitedb blacktower/ts3server-alpine-sqlite logpath=/data/logs/ query_ip_whitelist=/data/query_ip_whitelist.txt query_ip_blacklist=/data/query_ip_blacklist.txt

```


# Первый запуск

Смотрим логи сервера:

	docker logs -f teamspeak

Нас интересуют две важных секции в логах:
```
------------------------------------------------------------------
                      I M P O R T A N T
------------------------------------------------------------------
               Server Query Admin Account created
         loginname= "serveradmin", password= "g79HTma2"
------------------------------------------------------------------

```

и

```
------------------------------------------------------------------
                      I M P O R T A N T
------------------------------------------------------------------
      ServerAdmin privilege key created, please use it to gain
      serveradmin rights for your virtualserver. please
      also check the doc/privilegekey_guide.txt for details.

2017-08-29 07:06:30.648729|INFO    |Query         |   |listening on 0.0.0.0:10011, :::10011
       token=yxDRZkjZSq0aRGbkjFYRoQhCiclF1iN0RSfNbeHp
------------------------------------------------------------------

```

Эти данные нам понадобятся для дальнейшего доступа. 

Скопируем необходимые данные и можем нажать Ctrl-C.   

# Административное подключение

Создаем подключение в тимспике:
Сервер: наш IP (в моем случае 192.168.1.80:9987)
Имя пользователя: serveradmin
Пароль сервера: g79HTma2

После запуска сервер попросит ввести ключ привилегии. Это строчка `token=yxDRZkjZSq0aRGbkjFYRoQhCiclF1iN0RSfNbeHp` (включая `token=`!)

Теперь можно настроить сервер :)

# Доступ извне

Для доступа на сервер извне скорее всего придется пробросить через роутер порты 9987/UDP, 10011 и 30033.
188.143.207.215:9987