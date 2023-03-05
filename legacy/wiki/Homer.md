# Homer
> https://github.com/bastienwirtz/homer

| | |
| ---------------------------------------------------------------------------- | -------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | Yes           |
| Default passwords                                                             | NA |
| Reverse Proxy Location | `/` |

***

* Docker compose project [apps/homer](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/homer)
* Ansible tasks [tasks/homer.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/homer.yml)

## Stack Info
Below are the docker containers deployed with `docker-compose.yml`
* Homer

## Configuration
| Config | Description |
| ------ | ----------- |
| [apps/homer/assets](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/homer/assets) | Homer configurations |
| [apps/nginx/locations/portainer.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/portainer.conf) | Nginx reverse proxy config |
