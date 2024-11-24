#!/bin/bash

# if [ ! -f /usr/local/bin/2_wp ]; then
# 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# 	chmod +x wp-cli.phar

# 	mv wp-cli.phar /usr/local/bin/2_wp

# 	cd /var/www/html

# 	rm -rf *

# 	wp core download --allow-root

# 	wp config create \
# 		--dbname=$WORDPRESS_DB \
# 		--dbuser=$WORDPRESS_DB_USER \
# 		--dbpass=$WORDPRESS_DB_PASSWORD \
# 		--dbhost=mariadb:3306 \
# 		--allow-root

# 	wp core install \
# 		--url=$DOMAIN_NAME \
# 		--title=$WORDPRESS_TITLE \
# 		--admin_user=$WORDPRESS_ADMIN \
# 		--admin_password=$WORDPRESS_ADMIN_PASSWORD \
# 		--admin_email=$WORDPRESS_ADMIN_EMAIL \
# 		--skip-email \
# 		--allow-root

# 	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
# fi

# chmod -R 777 /var/www/html

# sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# echo "clear_env = no" >> /etc/php/7.4/fpm/pool.d/www.conf
# #php?wordpress? -> 환경변수 초기화 방지

# # 먼지 모르겠지만 일단 넣었따 -> php7.4-fpm.pid가 생기고 cat하면 7 나온다
# mkdir -p /run/php

# exec /usr/sbin/php-fpm7.4 -F


#!/bin/bash

if [ ! -f /usr/local/bin/2_wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    chmod +x wp-cli.phar

    mv wp-cli.phar /usr/local/bin/wp  # 여기를 수정했습니다.

    # PATH에 추가 (옵션)
    echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
    source ~/.bashrc
fi

# WP-CLI가 설치되었는지 확인
if ! command -v wp &> /dev/null; then
    echo "WP-CLI 설치에 실패했습니다."
    exit 1
fi

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

wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --allow-root

# 테마 설치후 변경
# wp theme install astra --activate --allow-root

chmod -R 777 /var/www/html

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

echo "clear_env = no" >> /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php

exec /usr/sbin/php-fpm7.4 -F
