FROM mortimor/nginx-pagespeed

#Add www-data user and group with IDs 82
RUN addgroup -g 82 -S www-data \
        && adduser -u 82 -S www-data -h /sbin/nologin -G www-data

#Add deploy user with UID 2500
RUN adduser -u 2500 -S deploy -h /bin/bash -G www-data
