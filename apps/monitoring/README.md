# Prometheus RPi4 Monitoring
Monitoring setup for RPi4, installs below components with `docker-compose`
* Prometheus
* Grafana
* Blackbox Exporter
* Speedtest exporter
* cadvisor(ARM)

## Manuall Installation
```
$ git clone https://github.com/veerendra2/init-my-rpi4
$ cd init-my-rpi4
$ cd monitoring
$ docker-compose up -d
```