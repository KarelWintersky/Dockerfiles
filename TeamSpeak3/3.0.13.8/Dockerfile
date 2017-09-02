FROM frolvlad/alpine-glibc
MAINTAINER Karel Wintersky <karel.wintersky@gmail.com>

EXPOSE 9987/udp 10011 30033

ENV \
	TS_VERSION="3.0.13.8" \
	TS_DIR=/opt/teamspeak \
	TS_RELEASE=http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 \
	TS_ARTIFACT="teamspeak.tar.bz2" \
	TS_DATA="/data"

RUN apk --update add tar \
	&& mkdir -p "${TS_DIR}" \
	&& echo ${TS_RELEASE} \
	&& wget ${TS_RELEASE} -O ${TS_ARTIFACT} \
	&& tar -xjf "${TS_ARTIFACT}" -C "${TS_DIR}" --strip-components=1 \
	&& rm "${TS_ARTIFACT}" "${TS_DIR}/CHANGELOG" "${TS_DIR}/libts3db_mariadb.so" \
	&& rm -r "${TS_DIR}/doc" "${TS_DIR}/redist" "${TS_DIR}/serverquerydocs" "${TS_DIR}/tsdns" \
	&& addgroup -g 503 teamspeak \
  	&& adduser -u 503 -G teamspeak -h ${TS_DIR} -S -D teamspeak \
  	&& chown -R teamspeak:teamspeak ${TS_DIR}

COPY data/ ${TS_DATA}

VOLUME ${TS_DATA}

RUN for file in $(find ${TS_DATA} -mindepth 1 -maxdepth 1); do \
	ln -s "${file}" $(echo $file | sed 's@^'"${TS_DATA}"'@'"${TS_DIR}"'@g') \
	; done

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
