# 기본 이미지로 Debian의 2번째 stable 버전 bullseye 사용
FROM debian:bullseye

# mariadb 설치에 필요한 패키지 업데이트 및 설치
RUN apt update && \
	apt install -y mariadb-server

# wordPress 데이터베이스 및 사용자 초기화 스크립트 복사
COPY tools/entrypoint.sh /

# entrypoint 파일 실행가능하도록 권한설정
RUN chmod +x /entrypoint.sh

# mariadb 초기화
ENTRYPOINT ["/entrypoint.sh"]