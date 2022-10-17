docker-lamp
===========
A simple LAMP (Linux, Apache, MySQL/MariaDB, PHP) using Docker containers. 
The master branch has the latest supported versions. 
Select a different branch for older versions of PHP.

Usage
-----
1) Make sure you have installed [Git](https://git-scm.com/downloads). Then,
- for **Linux** install [Docker Engine Server](https://docs.docker.com/engine/install/#server) (**not** Docker *Desktop*) and see [Post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/) to manage Docker as a non-root user.
- for **macOS** install [Docker Desktop for Mac (macOS)](https://docs.docker.com/desktop/install/mac-install/)
- for **Windows** install [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)

2) Configure environment variables in Docker Compose
```shell
cp .env.sample .env
```
```shell
# For Unix-like machines (Linux and Mac)
id -u # If the result is different from 1000, replace the UID value in the .env file
id -g # If the result is different from 1000, replace the GID value in the .env file
```

3) Build and run all containers
```shell
docker-compose build
docker-compose up -d
```

4) Test
- Web -> [http://localhost:4001](http://localhost:4001)
- Phpmyadmin -> [http://localhost:4003](http://localhost:4003) (username: root, password: pass123)

Enjoy!
