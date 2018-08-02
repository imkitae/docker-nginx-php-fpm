# nginx-php-fpm
[![Build Status](https://travis-ci.com/imkitae/docker-nginx-php-fpm.svg?branch=master)](https://travis-ci.com/imkitae/docker-nginx-php-fpm)
[![](https://images.microbadger.com/badges/version/ktkang/nginx-php-fpm.svg)](http://microbadger.com/images/ktkang/nginx-php-fpm)
[![](https://images.microbadger.com/badges/image/ktkang/nginx-php-fpm.svg)](http://microbadger.com/images/ktkang/nginx-php-fpm)

Docker image for PHP web service using Nginx + PHP-FPM


# Usage
```bash
docker run -it --rm \
    -p 8000:80 \
    -v $(pwd)/web:/var/www/html \
    ktkang/nginx-php-fpm:latest

// You can see php info page.
open http://localhost:8000
```

# Environment variables

### PHP
- XDEBUG_ENABLE (default = 0)
- PHP_TIMEZONE (default = Asia/Seoul)

### Nginx
- NGINX_SERVER_ROOT (default = /var/www/html)
- NGINX_HEALTH_CHECK_PATH (default = /health)


### PHP-FPM
- PHPFPM_PM_MAX_CHILDREN (default = 50)
- PHPFPM_PM_START_SERVERS (default = 20)
- PHPFPM_PM_MIN_SPARE_SERVERS (default = 15)
- PHPFPM_PM_MAX_SPARE_SERVERS (default = 35)
- PHPFPM_PM_MAX_REQUESTS (default = 512)
