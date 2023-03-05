# Monitoring
>* https://prometheus.io/
>* https://grafana.com/

| Info                                                                         | Status                                                                                                                                      |
| ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| Enable [userns-remap](https://docs.docker.com/engine/security/userns-remap/) | Yes                                                                                                                                         |
| Default Credentials for Grafana                                                              | - Username: [`admin`](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/monitoring/grafana/grafana.env#L1)<br/> - Password: [`changeme`](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/monitoring/secrets/grafana_admin_password.txt) |
| Reverse Proxy Location | - `/grafana` <br/> - `/prometheus`

***

* Docker compose project [apps/monitoring](https://github.com/veerendra2/raspberrypi-homeserver/tree/main/apps/monitoring)
* Ansible tasks [tasks/monitoring.yml](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/monitoring.yml)

## Stack Info
This stack includes below components and its dashboards in grafana
* Prometheus
* Grafana
* cAdvisor
* Blackbox exporter
* Node exporter
* Speedtest exporter

## Other Configuration
| Config                                                                                                                                          | Description                               |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| [apps/monitoring/docker-compose.yml#L33](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/monitoring/docker-compose.yml#L33) | Sub-path `/prometheus/` configuration     |
| [apps/monitoring/grafana/grafana.env](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/monitoring/grafana/grafana.env#L5) | Grafana configuration        |
| [apps/nginx/locations/prometheus.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/prometheus.conf)     | Nginx reverse proxy config for Prometheus |
| [apps/nginx/locations/grafana.conf](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/apps/nginx/locations/grafana.conf)           | Nginx reverse proxy config Grafana        |

## References
* https://github.com/veerendra2/raspberrypi-homeserver/issues/34#issuecomment-1326854587
