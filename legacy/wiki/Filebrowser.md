# File Browser
> https://github.com/filebrowser/filebrowser

| | |
| ---------------------------------------------------------------------------- | -------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | No (`root` user)           |
| Default credentials                                                              | - Username: `admin` <br/> - Password: `admin` |
| Reverse Proxy Location | `/filebrowser` |
***

* Docker compose project [apps/filebrowser](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/filebrowser)
* Ansible tasks [tasks/filebrowser.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/filebrowser.yml)

## Stack Info
Below are the docker containers deployed with `docker-compose.yml`
* File Browser

## Configuration
| Config | Description |
| ------ | ----------- |
| [apps/filebrowser/.env](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/filebrowser/.env) | Filebrowser configuration |
| [apps/filebrowser/docker-compose.yml#L22-L23](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/filebrowser/docker-compose.yml#L22-L23) | Directory mount configuration |
| [apps/nginx/locations/filebrowser.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/filebrowser.conf) | Nginx reverse proxy config |

## References
* https://github.com/veerendra2/raspberrypi-homeserver/issues/9
* https://github.com/veerendra2/raspberrypi-homeserver/issues/30