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

In this repo you can find:

* `docker-compose.yaml` contains 3 containers:
  * php-apache, to run your PHP app by the service called [Apache HTTP Server](https://httpd.apache.org/)
  * mysql, to run the MySQL service
  * phpmyadmin, to run the app [phpMyAdmin](https://www.phpmyadmin.net/), useful to handle the administration of your MySQL
* `Dockerfile` contains the recipe of the packages and modules that you need for your PHP app or Apache service.
* a simple PHP app with
  * `public/index.php`, that it is the main script called
  * `config/database.php`, that contains the database configuration
  * you can change the configuration on the file named `.env`
    * the tool **docker-compose** will load it on `docker-compose.yaml`
      * you can see the environment variables are used under the parameter *environment* in *php-apache* and *mysql* services
    * the PHP app will have them as environment variables
      * you can see the environment variables are used in the file named `config/database.php`
  * examples of 
    * `public/.htaccess`, to route the requests on `public/index.php` file
    * `config/.htaccess`, to deny any requests
* a simple SQL table file named `sql/schemas.sql` that you can load on **phpMyAdmin**
  * directly by **Import** button
  * by copy & paste its content on **SQL** section

When you start the containers, you can use these links:

* your web site, http://localhost:80/ 
* phpMyAdmin, http://localhost:8080/

## Multiple environments

If you need to run more environments, you can comment in `docker-compose.yaml` the parameter `container_name`:

* without `container_name`, docker create the name as **DocumentRoot-ServiceName**
  * if the DocumentRoot is *docker-compose-lamp* and the service name is *php-apache*
  * the container name will be *docker-compose-lamp-php-apache*

## Docker Commands

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

## Tips & Tricks

### Change something on Dockerfile of php-apache container

You must to rebuild its image,

```sh
# remove its container
docker-compose down php-apache
# force to recreate the new container
docker-compose up php-apache --build -d
```

If it does not work,

```sh
# remove its container
docker-compose down php-apache
# get the IMAGE ID of the php-apache image
docker images
# remove the image
docker rmi <IMAGE ID>
# recreate the new container
docker-compose up php-apache -d
```

### Change something on docker-compose.yaml

You must to restart all containers,

```sh
docker-compose restart
```

## License

This package is released under the AGPLv3 license. See [LICENSE](./LICENSE) for details.