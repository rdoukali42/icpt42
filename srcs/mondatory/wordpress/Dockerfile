FROM debian:buster

RUN apt-get update -y \
    && apt-get install -y php-fpm php-mysql curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /var/www/
COPY ./tools/wp-config.php ./wp
COPY ./tools /var/www/

RUN chmod +x /script.sh

CMD ["/script.sh"]

