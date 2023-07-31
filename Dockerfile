FROM ubuntu:latest

RUN apt update && \
    apt install -y mysql-client time

CMD ["time", "mysqlimport", "-u", "root", "-p", "password", "/data/database.sql"]
