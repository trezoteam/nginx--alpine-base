#!/bin/bash
echo "127.0.0.1 nginx" >> /etc/hosts
>/var/log/nginx/startup.log

if [ -n "$WAIT_VARNISH" ];then
  while [ ! -f /etc/opt/nginx/hosts ];do
    echo "looking for /etc/opt/nginx/hosts..." >> /var/log/nginx/startup.log
    sleep 1
  done
  cat /etc/opt/nginx/hosts >> /etc/hosts
fi

sed -i 's/^hosts:.*/hosts: dns files/g' /etc/nsswitch.conf
exec /usr/sbin/nginx -g "daemon off;"
