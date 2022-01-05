docker-lamp
===========
A simple LAMP (Linux, Apache, MySQL/MariaDB, PHP) using Docker containers

Usage
-----
1) Make sure you have installed [Git](https://git-scm.com/downloads), [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/). For linux see [Post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/) to manage Docker as a non-root user

2) (Unix-like host) Generate .env file with local environment variables

```
cp .env.sample .env
id
```
Update UID & GID variables in .env file

2) (Windows host) Generate .env file with local environment variables

For Unix-like host machine
```
cp .env.sample .env
```

3) Build and run all containers
```
docker-compose build
docker-compose up -d
```

4) Test
- (Web) [http://localhost:4001](http://localhost:4001)
- (Phpmyadmin) [http://localhost:4003](http://localhost:4003) (username: root, password: pass123)

Enjoy!
