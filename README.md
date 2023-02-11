# Deploying a laravel app using Docker and Docker-Compose


## Task

- Write a dockerfile for the laravel app

- write a docker compose file for the services involved in the laravel

- Mount a volume to write:

  a. a real time log entry

  b. mysql data

name these directories whatever you like.


This docker-compose.yml file specifies two services: `db` and `web`. The db service uses the `mysql:8.0` image, and sets environment variables for the root password, database name, user, and password. The database data is persisted using a Docker volume named `db_data`.

The web service uses the `php:7.4-apache` image, maps port 80 on the host to port 80 in the container, and mounts the current directory as `/var/www/html` in the container. The web service depends on the `db` service, meaning that the `db` service will be started before the `web` service.

You can start the LAMP stack by navigating to the directory containing the `docker-compose.yml` file and running:
```bash
docker-compose up
```
This will start the services defined in the `docker-compose.yml` file and create the specified volumes. You should then be able to access your PHP application by visiting `http://localhost` in your web browser.