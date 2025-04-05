
# Media Server Setup with VPN, Docker, and Download Automation

This repository provides an automated solution to set up a **Media Server** with **VPN**, **Docker**, **NZBGet**, and **Torrent** downloading, along with monitoring and notification services. It includes the setup for services like **Sonarr**, **Radarr**, **Bazarr**, **Jellyfin**, **Portainer**, **Watchtower**, **Prometheus**, **Grafana**, and others.

## Features

- **VPN (NordVPN)**: Configures NordVPN for secure downloads through torrent and NZB.
- **Download Automation**: Install **NZBGet** for NZB downloads and **Transmission** or **qBittorrent** for torrents.
- **Docker Compose**: Automates Docker container management for **Jellyfin**, **Sonarr**, **Radarr**, **Bazarr**, **Portainer**, **Watchtower**, **Prometheus**, **Grafana**, etc.
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
SENDGRID_API_KEY=your-sendgrid-api-key
PUID=1000
PGID=1000
```

- `SENDGRID_API_KEY` is your **SendGrid API key** (optional, used for email notifications).
- `PUID` and `PGID` represent your **user** and **group IDs**. You can find these by running `id` in the terminal.

### 4. Running the Setup Script

To set up the server, including **VPN**, **NZB**, and **Torrent downloading** services, run the `setup.sh` script:

```bash
./setup.sh
```

This script will:

1. Install **NordVPN** and configure it to route **torrent** and **NZB** downloads through the VPN.
2. Install **NZBGet** for NZB downloads and **Transmission** or **qBittorrent** for torrent downloads.
3. Configure the **Docker containers** for **Sonarr**, **Radarr**, **Bazarr**, **Jellyfin**, and others using **Docker Compose**.
4. Set up **Prometheus** and **Grafana** for monitoring, and send **Signal** notifications when the setup completes or if any container goes down.

### 5. Accessing Services

Once everything is set up, you can access the following services:

- **Jellyfin**: `http://localhost:8096`
- **Sonarr**: `http://localhost:8989`
- **Radarr**: `http://localhost:7878`
- **Bazarr**: `http://localhost:6767`
- **Portainer**: `http://localhost:9000`
- **Prometheus**: `http://localhost:9090`
- **Grafana**: `http://localhost:3000`

### 6. Additional Configuration for VPN

The **VPN** setup uses **NordVPN** and connects to a specific server for downloading torrents and NZBs securely. If you wish to connect to a specific server or configure the VPN settings differently, you can modify the `setup.sh` script where the VPN connection is established.

### 7. Monitoring and Alerts

**Prometheus** monitors the state of the **Docker containers** and will trigger alerts if any container stops. Alerts will be sent to **Signal** (via **Signal-CLI**) for immediate notification.

### 8. Troubleshooting

If you encounter issues with the setup, you can check the logs for the Docker containers:

```bash
docker logs <container-name>
```

To troubleshoot VPN issues, you can check the **NordVPN** status:

```bash
nordvpn status
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Acknowledgements

- This solution uses **Docker**, **Docker Compose**, **GitHub Actions**, **Signal-CLI**, **Prometheus**, and **Grafana** for monitoring and notifications.
- The containers are based on official images from **LinuxServer.io** and **other trusted sources**.
