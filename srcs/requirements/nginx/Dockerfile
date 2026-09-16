FROM debian:bookworm
RUN apt-get update 
RUN apt-get install -y \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/nginx/ssl

COPY cnf/nginx.conf /etc/nginx/conf.d/default.conf

COPY tools/nginx.sh /bin/nginx.sh
RUN chmod +x /bin/nginx.sh

ENTRYPOINT ["nginx.sh"]


