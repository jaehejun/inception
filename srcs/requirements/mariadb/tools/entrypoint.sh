#!/bin/bash
# entrypoint.sh

# MariaDB 서비스 시작
service mariadb start

# MariaDB가 시작될 때까지 대기
while ! mysqladmin ping --silent; do
    sleep 1
done

# 50-server.cnf 파일의 bind-address를 0.0.0.0 으로 변경해 외부(wordpress)에서도 접속이 가능하게 설정
sed -i 's/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


# 데이터베이스가 초기화되지 않았는지 확인(데이터베이스 이미 존재하면 mysqld_safe만 실행)
if [ ! -d "/var/lib/mysql/$WORDPRESS_DB" ]; then
    # root 비밀번호 설정
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    
    # 새로운 데이터베이스 생성
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB};"
    
    # 새로운 사용자 생성 및 권한 부여
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE USER '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';"
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB}.* TO '${WORDPRESS_DB_USER}'@'%';"
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
fi

# service mariadb stop
mariadb-admin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

# MariaDB를 포그라운드로 실행
exec mysqld_safe