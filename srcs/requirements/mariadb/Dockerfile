FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-client mariadb-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]
