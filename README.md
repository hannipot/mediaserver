
# Media Server Setup with VPN, Docker, and Download Automation

This repository provides an automated solution to set up a **Media Server** with **VPN**, **Docker**, **NZBGet**, **Torrent downloading**, **Plex**, **Tautulli**, **Ombi**, **qBittorrent**, **Gluetun**, and **Prowlarr** for automated downloads and monitoring.

## Features

- **VPN (Gluetun)**: Configures **Gluetun** (VPN client) for secure downloads through **torrent** and **NZB**.
- **Download Automation**: Install **NZBGet** for NZB downloads and **Transmission** or **qBittorrent** for torrents.
- **Plex Setup**: **Plex** can be used as an alternative to Jellyfin, with **Tautulli** for monitoring and **Ombi** for user requests.
- **Docker Compose**: Automates Docker container management for **Jellyfin**, **Plex**, **Sonarr**, **Radarr**, **Bazarr**, **Portainer**, **Watchtower**, **Prometheus**, **Grafana**, etc.
- **Monitoring and Alerts**: Uses **Prometheus** and **Grafana** for monitoring, with **Signal** notifications for container failures.
- **Signal Notifications**: Sends messages about setup completion and alerts for any service failure.

## Setup

### 1. Clone the Repository

Clone the repository to your local machine or server:

```bash
git clone https://github.com/<your-username>/media-server-automation.git
cd media-server-automation
```

### 2. Install Dependencies

Ensure that the following are installed on your system:
- **Docker** and **Docker Compose**
- **Signal-CLI** (to send notifications through Signal)

If Docker and Docker Compose are not installed, the `setup.sh` script will install them.

### 3. Environment Variables

Create a `.env` file in the root directory of your project with the following content:

```env
# Docker User and Group IDs (adjust to match your system)
PUID=1000
PGID=1000

# NordVPN Credentials for secure download routing
NORDVPN_USERNAME=your_nordvpn_username
NORDVPN_PASSWORD=your_nordvpn_password
NORDVPN_SERVER=your_preferred_server_location

# Signal-CLI Configuration for notifications
SIGNAL_PHONE_NUMBER=your_signal_phone_number
SIGNAL_API_KEY=your_signal_api_key 

# SendGrid API Key for email notifications (optional)
SENDGRID_API_KEY=your_sendgrid_api_key # If using SendGrid for email notifications

# Docker Configuration (optional)
DOCKER_COMPOSE_FILE=docker-compose.yml

# Enable or disable automatic updates (optional)
ENABLE_AUTOMATIC_UPDATES=true

# Ports for external access
EXTERNAL_PORT_JELLYFIN=8096
EXTERNAL_PORT_SONARR=8989
EXTERNAL_PORT_RADARR=7878
EXTERNAL_PORT_BAZARR=6767
EXTERNAL_PORT_PORTAINER=9000
EXTERNAL_PORT_PROMETHEUS=9090
EXTERNAL_PORT_GRAFANA=3000
```

- `SENDGRID_API_KEY` is your **SendGrid API key** (optional, used for email notifications).
- `NORDVPN_USERNAME`, `NORDVPN_PASSWORD`, and `NORDVPN_SERVER` are your **NordVPN credentials** for secure downloads.
- `SIGNAL_PHONE_NUMBER` and `SIGNAL_API_KEY` are used for sending **Signal notifications**.

### 4. Running the Setup Script

To set up the server, including **VPN**, **NZB**, and **Torrent downloading** services, run the `setup.sh` script:

```bash
./setup.sh
```

This script will:

1. Install **Gluetun (VPN)** and configure it to route **torrent** and **NZB** downloads through the VPN.
2. Install **NZBGet** for NZB downloads and **Transmission** or **qBittorrent** for torrent downloads.
3. Install **Plex**, **Tautulli**, and **Ombi** for managing Plex media.
4. Set up **Prometheus** and **Grafana** for monitoring, and send **Signal** notifications when the setup completes or if any container goes down.

### 5. Accessing Services

Once everything is set up, you can access the following services:

- **Plex**: `http://localhost:32400`
- **Jellyfin**: `http://localhost:8096`
- **Sonarr**: `http://localhost:8989`
- **Radarr**: `http://localhost:7878`
- **Bazarr**: `http://localhost:6767`
- **Tautulli**: `http://localhost:8181`
- **Ombi**: `http://localhost:5000`
- **Portainer**: `http://localhost:9000`
- **Prometheus**: `http://localhost:9090`
- **Grafana**: `http://localhost:3000`

### 6. Troubleshooting

If you encounter issues with the setup, you can check the logs for the Docker containers:

```bash
docker logs <container-name>
```

To troubleshoot VPN issues, you can check the **Gluetun** status:

```bash
docker logs gluetun
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Acknowledgements

- This solution uses **Docker**, **Docker Compose**, **GitHub Actions**, **Signal-CLI**, **Prometheus**, and **Grafana** for monitoring and notifications.
- The containers are based on official images from **LinuxServer.io** and **other trusted sources**.
