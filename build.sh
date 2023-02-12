#!/bin/bash

# Building the laravel app
docker-compose build laravel

# Starting the Services
docker-compose up -d

# Listing the images
docker images
