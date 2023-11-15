FROM debian:buster

RUN apt update -y && \
    apt install php-fpm php-mysql curl -y && \
    apt-get update

EXPOSE 9000

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /
COPY ./tools /var/www/

RUN chmod +x /var/www/script.sh

CMD [ "/script.sh" ]

