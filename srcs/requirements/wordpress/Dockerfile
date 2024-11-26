# srcs/wordpress/Dockerfile
FROM debian:bullseye

# 필요한 패키지 설치
RUN apt update && apt install -y \
    php7.4-fpm \
    php7.4-mysql \
    mariadb-client \
    curl

RUN mkdir -p /var/www/html

COPY ./tools/install.sh /

RUN chmod +x /install.sh

EXPOSE 9000

CMD ["/install.sh"]