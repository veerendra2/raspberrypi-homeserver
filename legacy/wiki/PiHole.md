# Pihole
> https://pi-hole.net/

| | |
| ---------------------------------------------------------------------------- | -------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | Yes           |
| Default Credentials                                                               | - Username: `admin`<br/>- Password: [`changeme`](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/pihole/secrets/pihole_admin_password.txt) |
| Reverse Proxy Location | `/admin` |

***

* Docker compose project [apps/pihole](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/pihole)
* Ansible tasks [tasks/pihole.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/pihole.yml). (Also covers steps there are mentioned in [docker-pi-hole#installing-on-ubuntu-or-fedora](https://github.com/pi-hole/docker-pi-hole#installing-on-ubuntu-or-fedora))

## Stack Info
Below are the docker containers deployed with `docker-compose.yml`
* Pihole
* DHCP helper

## Configuration
| Config | Description |
| ------ | ----------- |
| [apps/pihole/.env](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/pihole/.env) | Pihole configuration |
| [apps/pihole/dnsmasq.d/80-dhcp-options.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/pihole/dnsmasq.d/80-dhcp-options.conf) | - Extra dhcp configuration when dhcp-helper being used <br/> - [More info](https://veerendra2.github.io/pihole-dhcp-relay/) |
| [apps/pihole/dnsmasq.d/99-dnsmasq-options.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/pihole/dnsmasq.d/99-dnsmasq-options.conf) | - Extra dhcp configuration when dhcp-helper being used <br/> - [More info](https://veerendra2.github.io/pihole-dhcp-relay/) |
| [apps/pihole/pihole/custom.list](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/pihole/pihole/custom.list) | Custom DNS entries |
| [apps/nginx/locations/portainer.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/portainer.conf) | Nginx reverse proxy config |

## References
* https://github.com/veerendra2/raspberrypi-homeserver/issues/10
* https://github.com/veerendra2/raspberrypi-homeserver/issues/5
* https://github.com/veerendra2/raspberrypi-homeserver/issues/34#issuecomment-1326855064
