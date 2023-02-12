#!/bin/bash

docker-compose build app

docker-compose up -d

docker container exec -it app /bin/bash && cd laravel && composer install