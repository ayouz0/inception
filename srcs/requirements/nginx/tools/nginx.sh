#!/bin/bash
set -e
openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/cert.key \
    -out    /etc/nginx/ssl/cert.crt \
    -subj  "/C=MA/ST=khoribga/L=khoribga/O=42/CN=${DOMAIN_NAME}"

exec nginx -g "daemon off;"
