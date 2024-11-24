# srcs/wordpress/Dockerfile
FROM debian:bullseye

# 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    curl

RUN mkdir -p /var/www/html

COPY ./tools/install.sh /

RUN chmod +x /install.sh

EXPOSE 9000

CMD ["/install.sh"]


# # Apache 설정
# RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# # php-fpm 설정
# RUN mkdir -p /run/php && \
#     chown www-data:www-data /run/php

# Apache 모듈 활성화
# RUN a2enmod rewrite proxy_fcgi setenvif
# RUN a2enconf php-fpm

# # WordPress 다운로드 및 설치
# RUN curl -O https://wordpress.org/latest.tar.gz && \
#     tar -xvzf latest.tar.gz && \
#     mv wordpress/* /var/www/html/ && \
#     rm -rf wordpress latest.tar.gz

# # wp-config.php 복사
# COPY ./conf/wp-config.php /var/www/html/

# # WordPress 파일 권한 설정
# RUN find /var/www/html/ -type d -exec chmod 755 {} \; && \
#     find /var/www/html/ -type f -exec chmod 644 {} \; && \
#     chown -R www-data:www-data /var/www/html/

# Apache 설정 파일 복사
# COPY ./conf/apache.conf /etc/apache2/sites-available/000-default.conf