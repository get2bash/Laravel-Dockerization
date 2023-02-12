# Deploying a laravel app using Docker and Docker-Compose


## Task

- Write a dockerfile for the laravel app

- write a docker compose file for the services involved in the laravel

- Mount a volume to write:

  a. a real time log entry

  b. mysql data

name these directories whatever you like.

You can start the LAMP stack by navigating to the directory containing the `docker-compose.yml` file and running:
```bash
docker-compose up
```
This will start the services defined in the `docker-compose.yml` file and create the specified volumes. You should then be able to access your PHP application by visiting `http://localhost` in your web browser.