
#!/bin/bash

# Update & Install Docker & Docker Compose (falls nicht vorhanden)
echo "Checking Docker installation..."
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    echo "Docker installed successfully!"
else
    echo "Docker is already installed!"
fi

echo "Checking Docker Compose installation..."
if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose not found. Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed successfully!"
else
    echo "Docker Compose is already installed!"
fi

# Set up the environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file..."
    cp .env.template .env
    echo ".env file created successfully!"
else
    echo ".env file already exists!"
fi

# Check if Docker-Compose is up-to-date
echo "Checking Docker Compose version..."
docker-compose --version

# Create necessary directories if not already present
mkdir -p ./config/jellyfin ./config/sonarr ./config/radarr ./config/bazarr ./data/portainer ./data/prometheus ./data/grafana

# Start the Docker containers
echo "Starting Docker containers..."
docker-compose up -d

# Verify if the containers are running
echo "Verifying if containers are running..."
docker ps

echo "All containers are now up and running!"
echo "You can access your services at the following ports:"
echo "  Jellyfin: http://localhost:8096"
echo "  Sonarr: http://localhost:8989"
echo "  Radarr: http://localhost:7878"
echo "  Bazarr: http://localhost:6767"
echo "  Portainer: http://localhost:9000"
echo "  Prometheus: http://localhost:9090"
echo "  Grafana: http://localhost:3000"
echo "Your setup is complete!"
