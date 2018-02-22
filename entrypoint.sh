#!/bin/bash
echo "127.0.0.1 nginx" >> /etc/hosts

if [ -f /etc/opt/nginx_hosts ];then
  cat /etc/opt/nginx_hosts >> /etc/hosts
else
  echo "127.0.0.1 varnish" >> /etc/hosts 
fi

sed -i 's/^hosts:.*/hosts: dns files/g' /etc/nsswitch.conf
exec /usr/sbin/nginx -g "daemon off;"
