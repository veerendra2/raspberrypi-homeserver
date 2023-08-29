# Torrent Stack
* All torrent traffic proxied through `wireguard` container with `dante-server` SOCKS5 protocal.
* Below docker services are configured with `healthchecks` that uses [`ip-test.sh`](./ip-test.sh) script to check current connection is secured or not. Set `vpn_ip` variable in `vars.yml` to check external ip is this ip or add `VPN_IP=<YOUR_IP>` environmental variable in `.vpn_ip`.
  * `qBittorrnet` + `wiregard` -> `docker-stack-qbittorrent.yml`
  * `radarr` -> `docker-stack-radarr.yml`
  * `sonarr` -> `docker-stack-sonarr.yml`
  * `jacket` -> `docker-stack-jackett.yml`
* Except wireguard, all services in this stack should connect only `network_private` network and configure proxy in the application itself.
* Download directory tree
  ```bash
  $ tree /media/disk2/downloads/
  /media/disk2/downloads/
  ├── incomplete
  └── torrents
  ```
  * `torrents` - Torrent files pick from this location

## More Info
* https://veerendra2.github.io/wireguard-qbittorrent-docker-swarm-1
* https://veerendra2.github.io/wireguard-qbittorrent-docker-swarm-2