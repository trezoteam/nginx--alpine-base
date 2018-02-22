#!/bin/bash
echo "127.0.0.1 nginx" >> /etc/hosts
sleep 5
if [ -f /etc/opt/nginx/hosts ];then
  cat /etc/opt/nginx/hosts >> /etc/hosts
else
  echo "127.0.0.1 varnish" >> /etc/hosts 
fi

sed -i 's/^hosts:.*/hosts: dns files/g' /etc/nsswitch.conf
exec /usr/sbin/nginx -g "daemon off;"
