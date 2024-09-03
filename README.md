# Docker LAMP
A lightweight LAMP (Linux, Apache, MySQL/MariaDB, PHP) stack using Docker. The `master` branch contains the latest supported versions of each component. To use older PHP versions, please check the respective branches.

## Usage
### 1) Prerequisites
Ensure that you have [Git](https://git-scm.com/downloads) installed, then follow the steps below based on your operating system:

- **Linux**: Install the [Docker Engine](https://docs.docker.com/engine/install/#server) (**not** Docker *Desktop*) and follow the [post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/) to manage Docker as a non-root user.
- **macOS**: Install [Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/).
- **Windows**: Install [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/).

### 2) Set up environment variables
Copy the sample environment file and adjust the user and group IDs if necessary:
```bash
cp .env.sample .env
````

For Unix-like systems (Linux and macOS) run:
```bash
id -u # If the output is different from 1000, update the UID in the .env file.
id -g # If the output is different from 1000, update the GID in the .env file.
````
### 3) Build and start containers
To build and start the Docker containers, run:
```bash
docker compose build
docker compose up -d
```

### 4) Access the services
- Web server: [http://localhost:4001](http://localhost:4001)
- phpMyAdmin: [http://localhost:4003](http://localhost:4003) (username: root, password: pass123)

Enjoy!
