#!/bin/bash
> /var/log/nginx/startup.log
if  grep -r "varnish:6081" /etc/nginx ;then
	echo "Looking for 'varnish'..." >> /var/log/nginx/startup.log
	while ! ping -c1 varnish 1>/dev/null 2>/dev/null ;do
		echo "Unable to resolve 'varnish'. Trying again in 5s" >> /var/log/nginx/startup.log
		sleep 5
	done
	echo "Found 'varnish'. Starting Nginx." >> /var/log/nginx/startup.log
fi

exec /usr/sbin/nginx -g daemon off
