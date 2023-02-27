# Jellyfin

>* https://jellyfin.org/
>* https://jellyfin.org/clients/

| | |
| ---------------------------------------------------------------------------- | -------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | No (`root` user)           |
| Default Credentials                                                             | No (Signup on first start) |
| Reverse Proxy Location | `/jellyfin` |
***

* Docker compose project [apps/jellyfin/docker-compose.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/jellyfin/docker-compose.yml)
* Ansible tasks [tasks/jellyfin.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/jellyfin.yml)

## Stack Info
* Jellyfin

## Configuration
| Location                                                                                                                                  | Description                                                                                                                                                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [apps/jellyfin/.env](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/jellyfin/.env)                                   | `JELLYFIN_PublishedServerUrl`. Publish this URL to clients                                                                                                                                                                                            |
| [apps/jellyfin/config/network.xml#L5](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/jellyfin/config/network.xml#L5) | - Sub-path `/jellyfin` configuration <br/> - Mounted in docker                                                                                                                                                                                        |
| [apps/jellyfin/config/system.xml#L5](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/jellyfin/config/system.xml#L5)   | - Enable metrics <br/> - Refer [issues/34#issuecomment-1321346366](https://github.com/veerendra2/raspberrypi-homeserver/issues/34#issuecomment-1321346366) for more info)                                                                             |
| [apps/jellyfin/docker-compose.yml#L26-L31](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/jellyfin/docker-compose.yml#L26-L31) | Directory mount configuration |
| [apps/nginx/locations/jellyfin.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/jellyfin.conf)   | - Nginx proxy config <br/> - NOTE: Allowed HTTP in [server.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/server.conf#L6). Refer [#18](https://github.com/veerendra2/raspberrypi-homeserver/issues/18) for more info |

## References
* https://github.com/veerendra2/raspberrypi-homeserver/issues/8
* https://github.com/veerendra2/raspberrypi-homeserver/issues/18
* https://github.com/veerendra2/raspberrypi-homeserver/issues/34#issuecomment-1321346366