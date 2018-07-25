FROM alpine:3.7

ENV XDEBUG_ENABLE 0
ENV PHP_TIMEZONE Asia/Seoul
ENV NGINX_SERVER_ROOT /var/www/html
ENV NGINX_SERVER_NAME localhost

RUN addgroup -S www-data \
&& adduser -D -H -s /sbin/nologin -G www-data www-data \
&& adduser -D -H -s /sbin/nologin -G www-data nginx

RUN apk --no-cache add \
    bash \
    php7 \
    php7-ctype \
    php7-curl \
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
&& mkdir -p /var/www/html \
&& chown www-data:www-data /var/www/html

COPY php/* /etc/php7/conf.d/
COPY php-fpm/* /etc/php7/
COPY nginx /etc/nginx

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

COPY nginx-entrypoint /usr/local/bin/
ENTRYPOINT ["nginx-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]

WORKDIR "/var/www/html"
