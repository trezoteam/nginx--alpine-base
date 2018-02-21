#!/bin/bash
echo "127.0.0.1 nginx" >> /etc/hosts && echo "127.0.0.1 varnish" >> /etc/hosts
sed -i 's/^hosts:.*/hosts: dns files/g' /etc/nsswitch.conf
exec /usr/sbin/nginx -g "daemon off;"
