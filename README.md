![GitHub](https://img.shields.io/github/license/veerendra2/raspberrypi-homeserver)
![GitHub Repo stars](https://img.shields.io/github/stars/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub forks](https://img.shields.io/github/forks/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub issues](https://img.shields.io/github/issues/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub release (release name instead of tag name)](https://img.shields.io/github/v/release/veerendra2/raspberrypi-homeserver?include_prereleases&style=plastic)
# Raspberry Pi Home Server
<p align="center">
<b>A collection of applications and tools to make awesome Raspberry Pi homerserver</b>
</p>

<table align="center">
<tr>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/194064977-eca90693-1ddb-46cf-8a77-91cdf9e4bc69.png" alt="PiHole" width="60"/> <br/>PiHole
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/194064712-9256cf97-b353-46b7-80b6-f0eb40ab7d92.png" alt="Grafana" width="60"/> <br/> Grafana
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/194065021-97ddcecc-bba4-4157-b720-461e7d3735e7.png" alt="Prometheus" width="60"/> <br/> Prometheus
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/194064903-5644c6be-ba19-4192-9a76-35ddc78d8c4b.png" alt="Portainer" width="60"/> <br /> Portainer
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/194067359-05781276-1953-4b6c-a548-c3d292d49389.png" alt="Homer" width="60"/> <br /> Homer
    </center>
  </td>
</tr>
<tr>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/194766544-2b539ee7-cb51-426f-9174-a98c1f94a044.png" alt="Jellyfin" width="60"/> <br /> Jellyfin
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/195693675-b363b46a-146d-49f0-9182-6fc59b3e281d.png" alt="Nextcloud" width="60"/> <br /> Nextcloud
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/194383872-f90aab62-ebac-4973-bbb0-766fafd2a8cd.png" alt="Filebrowser" width="60"/> <br /> Filebrowser
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/221434420-2277ee82-115d-4ec6-bbe7-d0a010687dda.png" alt="Traefik" width="60"/> <br /> Traefik
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/196800928-49cd5781-88b2-40ff-b398-7d335cca24c0.png" alt="ufw" width="60"/> <br /> ufw
    </center>
  </td>
</tr>
</table>


<p align="center">
  <img src="https://user-images.githubusercontent.com/8393701/221664828-4531e8b6-491c-44b3-b270-cda18040abba.png" /><br/>Docker Swarm
</p>


<!-- <table>
<center>
<img src="https://user-images.githubusercontent.com/8393701/221664828-4531e8b6-491c-44b3-b270-cda18040abba.png" alt="Docker Swarm"/> <br/>Docker Swarm
</center>
</tr>
</table> -->

## Table of Contents
* [Features](https://github.com/veerendra2/raspberrypi-homeserver#features)
* [Homer screenshot](https://github.com/veerendra2/raspberrypi-homeserver#homer-screenshot)
* [Getting started](https://github.com/veerendra2/raspberrypi-homeserver#getting-started)
* [Docker swarm services architecture](https://github.com/veerendra2/raspberrypi-homeserver/wiki)
* [Project roadmap](https://github.com/veerendra2/raspberrypi-homeserver/projects)
* [Docs](https://github.com/veerendra2/raspberrypi-homeserver/wiki)

## Features
* Fully automated with Ansible
* All services are deployable on docker swarm
* Traefik reverse proxy
* Grafana dashboards to view
  * System metrics
  * Internet speed everyone hour
  * Uptime with blackbox exporter
  * Docker container metrics
* Beautiful Homer dashboard to view all services
* Uncomplicated firewall

## Homer screenshot
![image](https://user-images.githubusercontent.com/8393701/221434707-6c8e83a5-8116-4f78-9b2f-941bf1c053e2.png)

## Getting started
* Follow prerequisite [manual steps](https://github.com/veerendra2/raspberrypi-homeserver/wiki/Manual-Steps) to prepare Pi
* Browse [vars.yml](./vars.yml) to configuration
```
$ git clone https://github.com/veerendra2/raspberrypi-homeserver.git
$ cd raspberrypi-homeserver
# Review vars.yml and inventory.yml and run
$ ansible-playbook main.yml
```
### NOTE
* The setup created to deploy all services on single node docker swarm cluster. If you want to use this setup on multi node swarm cluster, there are some additional tweaks required like
  * Change plancement
    ```
    ...
      deploy:
        replicas: 1
        placement:
          constraints: [node.role == manager]
    ...
    ```
* Currently I'm using IP address `192.168.0.120` to access services, change services configs if you have a domain
