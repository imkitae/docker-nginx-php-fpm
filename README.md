# nginx-php-fpm
Docker image for PHP web service using nginx + php-fpm

# Usage
```bash
docker run -it --rm \
    -p 8000:80 \
    -v $(pwd):/var/www/html \
    ktkang/nginx-php-fpm:latest

// You can see php info page.
open http://localhost:8000
```

# Environment variables
- XDEBUG_ENABLE (default = 0)
- PHP_TIMEZONE (default = Asia/Seoul)
- NGINX_SERVER_ROOT (default = /var/www/html)
- NGINX_SERVER_NAME (default = localhost)
