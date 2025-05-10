# Docker Compose LAMP

LAMP is the acronym for Linux Apache MySQL PHP, but over the years it has been used for:
- Linux Apache MySQL PHP
- Linux Apache MySQL Perl
- Linux Apache MySQL Python
- Linux Apache Mongo .. and so on

This repo is part of the [educational repositories](https://github.com/pandle/materials) to learn how to write standard code.

## Docker

Docker is a tool that helps you package your application and everything it needs (like code, libraries, and settings) into one container so it can run reliably on any computer.

Think of it like a shipping container for software: no matter where you send it, the app inside will work the same way.

## Docker Compose

Docker Compose is a tool for defining and running multi-container applications.

Compose simplifies the control of your entire application stack, making it easy to manage services, networks, and volumes in a single YAML configuration file. Then, with a single command, you create and start all the services from your configuration file.

## Description of Docker Compose LAMP

`docker-compose.yaml` contains 3 containers:

* php-apache, to run your PHP app by the service called [Apache HTTP Server](https://httpd.apache.org/)
* mysql, to run the MySQL service
* phpmyadmin, to run the app [phpMyAdmin](https://www.phpmyadmin.net/), useful to handle the administration of your MySQL

`Dockerfile` contains the recipe of the packages and modules that you need for your PHP app or Apache service.

When you start the containers, you can use these links:

* 

## Commands

### Show active docker containers

For getting the info about each container

* CONTAINER ID, identity number of the container that you can use in `docker` or `docker-compose` command
* IMAGE, docker image used to create that container
* COMMAND, the statement used at the container starts
* CREATED, when the container started for the first time
* STATUS, the container status
* PORTS, the container ports
* NAMES, the container name that you can use in `docker` or `docker-compose` command

```sh
docker ps -a
```

### Start docker containers

For starting all containers together,

```sh
docker-compose up -d
```

For starting only the docker container called php-apache,

```sh
docker-compose up php-apache -d
```

### Get the log of a container

For getting the logs of the docker container called php-apache,

```sh
docker logs php-apache
```

### Stop docker containers

For deleting all containers together,

```sh
docker-compose down
```

For deleting only the docker container called php-apache,

```sh
docker-compose down php-apache
```
