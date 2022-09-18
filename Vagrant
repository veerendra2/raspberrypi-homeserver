# Author: Veerendra K
# Description: Spawns VMs for testing

### BOXES LIST ###
#
# ubuntu/bionic64
# centos/7
# minimal/trusty64
# alpine/alpine64

### MODIFY SCRIPT BELOW ACCORDING TO DISTRO ###

$script = <<-SCRIPT
apt-get update && apt-get upgrade -y
apt-get autoremove -y
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
pushd /home/vagrant/vagrant_data
sudo docker-compose up -d
# yum update -y
SCRIPT


NODES_COUNT = 1
RAM_MB = 3048
CORE_COUNT = 4
BOX = "ubuntu/bionic64"


Vagrant.configure("2") do |config|

  (1..NODES_COUNT).each do |i|
    config.vm.define "box#{i}" do |server|
      server.vm.box = BOX
      server.vm.hostname = "box#{i}"

      server.vm.provider "VirtualBox" do |v|
        v.name = "box#{i}"
        v.memory = RAM_MB
        v.cpus = CORE_COUNT
      end
      server.vm.network "private_network", ip: "192.168.56.2"

      # server.vm.network :forwarded_port, guest: 22, host: 10122
      server.vm.synced_folder ".", "/home/vagrant/vagrant_data", type: 'rsync'
      # server.vm.provision "shell", path: "script_on_host.sh"

      server.vm.provision "shell", inline: $script
    end
  end
end
