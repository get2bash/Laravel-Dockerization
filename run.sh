#!/bin/bash

docker-compose exec laravel composer install
docker-compose exec laravel php artisan key:generate
docker-compose exec laravel php artisan config:cache
docker-compose exec laravel php artisan migrate
docker-compose exec laravel php artisan db:seed > /dev/null