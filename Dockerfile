FROM robtimmer/alpine-nginx-pagespeed

VOLUME ["/etc/nginx", "/wwwroot"]

#Add www-data user and group with IDs 2500
RUN addgroup -g 82 -S www-data \
        && adduser -u 82 -S www-data -h /sbin/nologin -G www-data

ENTRYPOINT ["nginx", "-g", "daemon off;"]
