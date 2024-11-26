#!/bin/bash

if [ ! -f /usr/local/bin/2_wp ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	chmod +x wp-cli.phar

	mv wp-cli.phar /usr/local/bin/wp

	cd /var/www/html

	rm -rf *

	wp core download --allow-root

	wp config create \
		--dbname=$WORDPRESS_DB \
		--dbuser=$WORDPRESS_DB_USER \
		--dbpass=$WORDPRESS_DB_PASSWORD \
		--dbhost=mariadb:3306 \
		--allow-root

	wp core install \
		--url=$DOMAIN_NAME \
		--title=$WORDPRESS_TITLE \
		--admin_user=$WORDPRESS_ADMIN \
		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
		--admin_email=$WORDPRESS_ADMIN_EMAIL \
		--skip-email \
		--allow-root

	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=subscriber --allow-root
fi

chmod -R 755 /var/www/html

# PHP-FPM 의 소켓 대신에 TCP 포트 9000 으로 웹 서버와 통신하도록 변경
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# 환경변수 초기화 방지
echo "clear_env = no" >> /etc/php/7.4/fpm/pool.d/www.conf

# PHP-FPM 프로세스의 ID를 기록하는 파일을 저장하는 디렉토리. 이 디렉토리가 없으면 PHP-FPM이 정상적으로 실행되지 않을 수 있음.
mkdir -p /run/php

# # wp-content 및 해당 디렉토리에 적절한 권한 부여
chmod -R 775 /var/www/html/wp-content
chown -R www-data:www-data /var/www/html/wp-content

# 테마와 플러그인 설치 및 활성화
wp theme install twentytwenty --activate --allow-root
wp plugin install akismet --activate --allow-root

# PHP-FPM을 포그라운드 모드로 실행하는 이유는 컨테이너의 메인 프로세스로 실행되어야 하기 때문입니다.
# Docker와 같은 환경에서는 메인 프로세스가 종료되면 컨테이너도 종료되므로, PHP-FPM을 포그라운드 모드로 실행하여 컨테이너가 계속 실행되도록 해야함
exec /usr/sbin/php-fpm7.4 -F