![GitHub](https://img.shields.io/github/license/veerendra2/raspberrypi-homeserver)
![GitHub Repo stars](https://img.shields.io/github/stars/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub forks](https://img.shields.io/github/forks/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub issues](https://img.shields.io/github/issues/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub release (release name instead of tag name)](https://img.shields.io/github/v/release/veerendra2/raspberrypi-homeserver?include_prereleases&style=plastic)
# Raspberry Pi Home Server
**A collection of applications and tools to make awesome Raspberry Pi homerserver.**
<table>
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
      <img src="https://user-images.githubusercontent.com/8393701/196514761-f3585baf-5d0e-4647-b3a7-727d219bf1ae.png" alt="Nginx" width="60"/> <br /> Nginx
    </center>
  </td>
  <td>
    <center>
      <img src="https://user-images.githubusercontent.com/8393701/196800928-49cd5781-88b2-40ff-b398-7d335cca24c0.png" alt="ufw" width="60"/> <br /> ufw
    </center>
  </td>
</tr>
</table>

> Actively working on this project to add more apps and simplify deployments on Raspberry Pi while keeping `docker-compose` project standalone in `apps/` directory. Check [projects](https://github.com/veerendra2/raspberrypi-homeserver/projects) tab for roadmap

## Deploy
* Follow prerequisite [manual steps](https://github.com/veerendra2/raspberrypi-homeserver/wiki/Manual-Steps) to prepare Pi
```
$ git clone https://github.com/veerendra2/raspberrypi-homeserver.git
$ cd raspberrypi-homeserver
# Review inventory.yml and run
$ ansible-playbook main.yml
```
Check [wiki pages](https://github.com/veerendra2/raspberrypi-homeserver/wiki) for more info
