#!/bin/bash

docker-compose exec app composer install
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan config:cache
docker-compose exec app php artisan migrate
docker-compose exec app php artisan db:seed > /dev/null