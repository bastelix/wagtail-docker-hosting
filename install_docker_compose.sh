#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to print success messages
function success_message {
    echo -e "${GREEN}$1${NC}"
}

# Update system packages
echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Remove old versions of Docker if they exist
echo "Removing old Docker versions if they exist..."
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# Install dependencies
echo "Installing necessary packages..."
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add Docker GPG key
echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
echo "Installing Docker..."
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Install Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Ensure Docker is running
echo "Starting and checking Docker..."
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker --no-pager

# Verify installation
echo "Verifying Docker and Docker Compose installation..."
docker --version
docker-compose --version

success_message "Docker and Docker Compose have been successfully installed and are up to date."
