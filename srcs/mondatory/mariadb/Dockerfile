FROM debian:buster

RUN apt-get update -y \
    && apt-get install -y mariadb-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/initial_db.sql \
    && rm -f /var/www/initial_db.sql

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /

CMD ["/script.sh"]