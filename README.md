# Inception_42

## Introduction
The **Inception** project is part of **42 School** and focuses on building a containerized infrastructure using **Docker**. 
It involves setting up and orchestrating multiple services, such as a web server (Nginx), a database (MariaDB/MySQL), and a CMS (WordPress), within isolated Docker containers.

## Getting started
This project is cross-platform compatible.
> Make sure you have installed [Docker Engine](https://docs.docker.com/engine/install/) before proceeding.
1. Clone this repository
```bash
git clone https://github.com/MatLBS/Inception_42.git
cd Inception_42
```
2. Create `srcs/.env` file containing the required environment variables (see below)
```bash
touch srcs/.env
```
3. Open `/etc/hosts` file and replace `localhost` by your domain name
```bash
sudo vim /etc/hosts
```
```diff
- 127.0.0.1 localhost
+ 127.0.0.1 sabras.42.fr
```
4. Build and start all services
```bash
make
```
The project will automatically create the required Docker images and containers.
The necessary volumes will be created in `{HOME}/data`.

Enjoy the code 😁
