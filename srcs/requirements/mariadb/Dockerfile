FROM debian:bookworm

RUN apt-get update

RUN apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY cnf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/db.sh /bin/db.sh

RUN mkdir -p /run/mysqld && chmod +x /bin/db.sh

ENTRYPOINT ["db.sh"]
