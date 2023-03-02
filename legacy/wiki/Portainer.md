# Portainer
> https://www.portainer.io/

| | |
| ---------------------------------------------------------------------------- | -------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | Yes           |
| Default credentials                                                              | - Username: `admin` <br/> - Password: [`changeme`](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/portainer/secrets/portainer_admin_password.txt) |
| Reverse Proxy Location | `/portainer` |

***

* Docker compose project [apps/portainer](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/portainer)
* Ansible tasks [tasks/portainer.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/portainer.yml)

## Stack Info
Below are the docker containers deployed with `docker-compose.yml`
* Portainer

## Configuration
| Config | Description |
| ------ | ----------- |
| [apps/nginx/locations/portainer.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/portainer.conf) | Nginx reverse proxy config |

## References
* https://github.com/veerendra2/raspberrypi-homeserver/issues/1