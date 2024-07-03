# Docker and Docker Compose Installation Script

This script installs the latest versions of Docker and Docker Compose on an Ubuntu 24 system. It ensures that both Docker and Docker Compose are up to date and properly configured.

## Prerequisites

- Ubuntu 24
- sudo privileges

## Usage

1. **Clone the Repository**

    Clone the repository and navigate to the directory:

    ```sh
    git clone https://github.com/bastelix/wagtail-docker-hosting.git
    cd wagtail-docker-hosting
    ```

2. **Make the Script Executable**

    Change the permissions of the script to make it executable:

    ```sh
    chmod +x install_docker_compose.sh
    ```

3. **Run the Script**

    Execute the script with sudo privileges:

    ```sh
    sudo ./install_docker_compose.sh
    ```

    The script will:
    - Update the system packages.
    - Remove old versions of Docker, if any.
    - Install necessary dependencies.
    - Add the Docker GPG key and repository.
    - Install Docker.
    - Install Docker Compose.
    - Enable and start Docker.
    - Verify the installation of Docker and Docker Compose.

## Verification

After the script completes, you can verify that Docker and Docker Compose are installed correctly by running:

```sh
docker --version
docker-compose --version
