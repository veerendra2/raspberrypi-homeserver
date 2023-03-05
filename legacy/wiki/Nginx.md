# Nginx Proxy
> https://www.nginx.com/

| | |
| ---------------------------------------------------------------------------- | -------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | Yes           |
| Default password                                                             | No |

***

* Docker compose project [apps/nginx](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/nginx)
* Ansible tasks [tasks/nginx.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/nginx.yml)

## Stack Info
Below are the docker containers deployed with `docker-compose.yml`
* Nginx

## Configuration
| Config | Description |
| ------ | ----------- |
| [apps/nginx/server.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/server.conf) | Nginx server configuration |
| [apps/nginx/locations](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/nginx/locations) | pps reverse proxy configuration |


* All apps reverse proxy configuration are splited in separate `.conf` and placed in `location`.
* Self-signed certification will be generated during the deployment.
```
$ tree .
.
├── docker-compose.yml
├── locations
│   ├── filebrowser.conf
│   ├── grafana.conf
│   ├── homer.conf
│   ├── jellyfin.conf
│   ├── nextcloud.conf
│   ├── pihole.conf
│   ├── portainer.conf
│   └── prometheus.conf
├── server.conf
└── ssl

2 directories, 10 files
```
