FROM alpine:3.7

RUN addgroup -S www-data \
&& adduser -D -h /var/www -H -s /sbin/nologin -G www-data www-data \
&& adduser -D -h /etc/nginx -H -s /sbin/nologin -G www-data nginx

RUN apk --no-cache add \
    bash \
    php7 \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fpm \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-pdo \
    php7-pdo_mysql \
    php7-session \
    php7-xdebug \
    nginx \
&& rm -rf /var/cache/apk/* \
&& rm -rf /var/www/* \
&& rm -rf /etc/php7/php-fpm.d \
&& mkdir -p /var/www/html /var/log/nginx /var/log/php7 \
&& chown www-data:www-data /var/www/html \
&& chmod -R 766 /var/log/nginx /var/log/php7

COPY php/* /etc/php7/conf.d/
COPY php-fpm/ /etc/php7/
COPY nginx /etc/nginx

# Forward logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log \
&& ln -sf /dev/stdout /var/log/php7/access.log \
&& ln -sf /dev/stderr /var/log/php7/error.log

EXPOSE 80 443

COPY nginx-php-fpm-entrypoint /usr/local/bin/
ENTRYPOINT ["nginx-php-fpm-entrypoint"]
CMD ["bash", "-c", "php-fpm7 && nginx"]

WORKDIR /var/www/html
