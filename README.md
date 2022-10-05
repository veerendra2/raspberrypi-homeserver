![GitHub](https://img.shields.io/github/license/veerendra2/raspberrypi-homeserver)
![GitHub Repo stars](https://img.shields.io/github/stars/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub forks](https://img.shields.io/github/forks/veerendra2/raspberrypi-homeserver?style=plastic)
![GitHub issues](https://img.shields.io/github/issues/veerendra2/raspberrypi-homeserver?style=plastic)
# Raspberry Pi Home Server
**A collection of applications and tools to make awesome Raspberry Pi homerserver.**
|   |   |   |   |   |
|:---:|:---:|:---:|:---:|:---:|
| <img src="https://user-images.githubusercontent.com/8393701/194064977-eca90693-1ddb-46cf-8a77-91cdf9e4bc69.png" alt="PiHole" width="60"/> <br /> PiHole|  <img src="https://user-images.githubusercontent.com/8393701/194064712-9256cf97-b353-46b7-80b6-f0eb40ab7d92.png" alt="Grafana" width="60"/> <br /> Grafana| <img src="https://user-images.githubusercontent.com/8393701/194065021-97ddcecc-bba4-4157-b720-461e7d3735e7.png" alt="Prometheus" width="60"/> <br /> Prometheus| <img src="https://user-images.githubusercontent.com/8393701/194064903-5644c6be-ba19-4192-9a76-35ddc78d8c4b.png" alt="Portainer" width="60"/> <br /> Portainer |  <img src="https://user-images.githubusercontent.com/8393701/194067359-05781276-1953-4b6c-a548-c3d292d49389.png" alt="Homer" width="60"/> <br /> Homer|
> Actively working on this project to add more apps and simplify deployments on Raspberry Pi while keeping `docker-compose` project standalone in `apps/` directory. Check [projects](https://github.com/veerendra2/raspberrypi-homeserver/projects) tab for roadmap

## Deploy
```
$ git clone https://github.com/veerendra2/raspberrypi-homeserver.git
$ cd raspberrypi-homeserver
# Specify you raspberry pi IP
$ ansible-playbook -i inventory.yml main.yml
```
Check [wiki pages](https://github.com/veerendra2/raspberrypi-homeserver/wiki) for more info