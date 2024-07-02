
# Wagtail CRX Docker Setup

This repository provides a setup for using Wagtail CRX with Docker under the "Image as Environment" model. The setup allows you to run two separate Wagtail instances with a single PostgreSQL database container and an Nginx proxy container.

## Project Purpose

The goal of this project is to provide a flexible and scalable development environment for Wagtail CRX. By using Docker containers, dependency on specific system configurations is reduced, and a consistent development environment is created. This setup allows you to quickly start developing and deploying Wagtail websites.

## Prerequisites

- Docker
- Docker Compose

## Setup

### Step 1: Clone the Repository

Clone the `wagtail-starter` repository:

```sh
git clone https://github.com/yourusername/wagtail-starter.git
cd wagtail-starter
```

### Step 2: Create the `.env` File

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
WAGTAIL_MEDIA_PATH_1=/path/to/wagtail1/media
WAGTAIL_STATIC_PATH_1=/path/to/wagtail1/static
WAGTAIL_DB_1=wagtaildb1
WAGTAIL_SITENAME_1="My Company Inc."
WAGTAIL_DOMAIN_1="www.example.com"

# Wagtail 2 configuration
WAGTAIL_VIRTUAL_HOST_2=yourdomain2.com
WAGTAIL_LETSENCRYPT_EMAIL_2=youremail2@example.com
WAGTAIL_MEDIA_PATH_2=/path/to/wagtail2/media
WAGTAIL_STATIC_PATH_2=/path/to/wagtail2/static
WAGTAIL_DB_2=wagtaildb2
WAGTAIL_SITENAME_2="Another Company LLC"
WAGTAIL_DOMAIN_2="www.anotherexample.com"
```

Replace the placeholders with your actual configuration values.

### Step 3: Build the Docker Images

Navigate to the project's root directory and build the Docker images for both Wagtail instances:

```sh
docker-compose build wagtail1
docker-compose build wagtail2
```

### Step 4: Start the Containers

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
wagtail-starter/
├── project1/
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   └── ... (other project files)
├── project2/
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   └── ... (other project files)
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
- **README.md**: This file.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

```

### `LICENSE`

Ensure the `LICENSE` file contains the full text of the MIT License:

```plaintext
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS",