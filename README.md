# Wagtail CRX Docker Setup

This repository provides a setup for using Wagtail CRX with Docker under the "Image as Environment" model. The setup allows you to run two separate Wagtail instances with a single PostgreSQL database container and an Nginx proxy container.

## Project Purpose

The goal of this project is to provide a flexible and scalable development environment for Wagtail CRX. By using Docker containers, dependency on specific system configurations is reduced, and a consistent development environment is created. This setup allows you to quickly start developing and deploying Wagtail websites.

## Prerequisites

- Docker
- Docker Compose

If Docker and Docker Compose are not installed on your system, you can use the provided installation script. For instructions, refer to the [Docker and Docker Compose Installation Guide](README_docker_install.md).

## Setup

### Step 1: Clone the Repository

Clone the `wagtail-docker-hosting` repository:

```sh
git clone https://github.com/bastelix/wagtail-docker-hosting.git
cd wagtail-starter
```

### Step 2: Create the Project Directories and Copy Files

Create the `project1` and `project2` directories and copy the necessary project files from the root directory:

```sh
mkdir project1 project2
cp Dockerfile project1/
cp docker-entrypoint.sh project1/
cp Dockerfile project2/
cp docker-entrypoint.sh project2/
```

Create the `media` and `static` directories within each project directory:

```sh
mkdir -p project1/media project1/static
mkdir -p project2/media project2/static
```

### Step 3: Create the `.env` File

Copy the `sample.env` file to `.env` and update it with your configuration values:

```sh
cp sample.env .env
```

Update the `.env` file in the project's root directory with the following content:

```env
# PostgreSQL configuration
POSTGRES_USER=wagtailuser
POSTGRES_PASSWORD=your_postgres_password

# Wagtail 1 configuration
WAGTAIL_VIRTUAL_HOST_1=yourdomain1.com
WAGTAIL_LETSENCRYPT_EMAIL_1=youremail1@example.com
WAGTAIL_MEDIA_PATH_1=./project1/media
WAGTAIL_STATIC_PATH_1=./project1/static
WAGTAIL_DB_1=wagtaildb1
WAGTAIL_SITENAME_1="My Company Inc."
WAGTAIL_DOMAIN_1="www.example.com"

# Wagtail 2 configuration
WAGTAIL_VIRTUAL_HOST_2=yourdomain2.com
WAGTAIL_LETSENCRYPT_EMAIL_2=youremail2@example.com
WAGTAIL_MEDIA_PATH_2=./project2/media
WAGTAIL_STATIC_PATH_2=./project2/static
WAGTAIL_DB_2=wagtaildb2
WAGTAIL_SITENAME_2="Another Company LLC"
WAGTAIL_DOMAIN_2="www.anotherexample.com"
```

Replace the placeholders with your actual configuration values.

### Step 4: Build the Docker Images

Navigate to the project's root directory and build the Docker images for both Wagtail instances:

```sh
docker-compose build wagtail1
docker-compose build wagtail2
```

### Step 5: Start the Containers

Start all containers with Docker Compose:

```sh
docker-compose up -d
```

### Accessing the Wagtail Instances

The Wagtail instances will be available at the domains configured in the `.env` file:

- Wagtail 1: [http://yourdomain1.com](http://yourdomain1.com)
- Wagtail 2: [http://yourdomain2.com](http://yourdomain2.com)

### Viewing Logs

To view the logs of the containers, use the following command:

```sh
docker-compose logs -f
```

### Stopping the Containers

To stop the containers, use the following command:

```sh
docker-compose down
```

## Project Structure

The repository contains the following files and directories:

```
wagtail-docker-hosting/
├── project1/
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   ├── media/
│   ├── static/
│   └── ... (other project files)
├── project2/
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   ├── media/
│   ├── static/
│   └── ... (other project files)
├── install_docker_compose.sh
├── sample.env
├── .env
├── docker-compose.yml
└── README.md
```

- **project1/**: Directory for the first Wagtail project.
- **project2/**: Directory for the second Wagtail project.
- **sample.env**: Sample environment variables file for project configuration.
- **.env**: Environment variables for project configuration. (use `sample.env` as template)
- **docker-compose.yml**: Docker Compose file to start the containers.
- **install_docker_compose.sh**: Script to install Docker and Docker Compose.
- **README.md**: This file.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


