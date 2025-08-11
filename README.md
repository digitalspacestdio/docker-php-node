PHP + NODEJS Docker Images
==========================
This repository contains Dockerfiles for PHP + NodeJS images based on Alpine Linux with multiple PHP versions (8.5, 8.4, 8.3, 8.2, 8.1, 8.0, 7.4, 7.3, 7.2, 7.1).


Run in cli mode
```bash
docker run --rm ghcr.io/digitalspacestdio/docker-php-node:7.1-14-1-alpine php -v
```

Run in fpm mode
```bash
docker run -v /var/www:/var/www --restart=always -p 9000:9000 ghcr.io/digitalspacestdio/docker-php-node:7.1-14-1-alpine php-fpm -R
```

Enable xdebug
```bash
docker run -e XDEBUG_MODE=debug -v /var/www:/var/www --restart=always -p 9000:9000 ghcr.io/digitalspacestdio/docker-php-node:7.1-14-1-alpine php-fpm -R
```