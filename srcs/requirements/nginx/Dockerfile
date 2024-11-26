# srcs/nginx/Dockerfile
FROM debian:bullseye

RUN apt update && apt install -y \
    nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=$DOMAIN_NAME"

COPY ./conf/inception.conf /etc/nginx/conf.d/

RUN chmod 755 /etc/nginx/conf.d/inception.conf

EXPOSE 443

# Nginx를 포그라운드 모드로 실행해 컨테이너의 메인 프로세스가 종료되지 않도록 함
CMD ["nginx", "-g", "daemon off;"]