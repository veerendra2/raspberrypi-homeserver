# Manual Steps
> _*Below documentation referred `user` as `veerendra`, `hostname` as `atom` and IP as `192.168.0.120`. Please change these values according your requirement_

## Write OS Image on SD card

* Download [RaspberryPI OS Imager](https://www.raspberrypi.com/software/)

Configure `hostname`, `user`, `wlan` and `locale` like below by clicking :gear: and click `WRITE`

<img src="https://user-images.githubusercontent.com/8393701/200187633-1f13925b-55f5-422c-ad08-2ae16165e631.png" alt="ufw" width="400"/>
<img src="https://user-images.githubusercontent.com/8393701/200187676-db43d300-5aa0-4c70-aad2-f6bf0225146c.png" alt="ufw" width="400"/>

## Configure your machine
> Below command should run on your machine(that you connect Pi)

* Copy ssh keys to Pi for password less authentication

   ```
   $ PIUSER="veerendra"
   $ PIIP="192.168.0.120"

   $ ssh-copy-id $PIUSER@$PIIP
   veerendra@192.168.0.120's password:

   Number of key(s) added: 1

   Now try logging into the machine, with:   "ssh 'veerendra@192.168.0.120'"
   and check to make sure that only the key(s) you wanted were added.
   ```
* Add ssh config
   ```
   cat >> ~/.ssh/config <<EOF
   Host atom
     HostName 192.168.0.120
     user veerendra
   EOF
   ```
## Configure your Pi
   > Below command should on Pi
1. Login into Pi and Set `root` user password
   ```
   veerendra@atom:~$ sudo passwd
   New password:
   Retype new password:
   passwd: password updated successfully
   ```
2. Make the user `sudoer`

   * Login into pi and run below commands
    ```
    veerendra@atom:~$ PIUSER="veerendra"

    veerendra@atom:~$ echo "$PIUSER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$PIUSER
    [sudo] password for veerendra:
    veerendra ALL=(ALL:ALL) NOPASSWD: ALL
    ```
    * Make sure you specify same user and IP in [inventory.yml#L5-L6](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/inventory.yml#L5-L6)
3. (Optional)Set static IPs to interfaces
   * This will also bring up the `eth0` internface which some won't come up by default
   ```
   # Set static IP for eht0
   $ {
      sudo netplan set ethernets.eth0.dhcp4=false
      sudo netplan set ethernets.eth0.addresses=[192.168.0.120/24]
      sudo netplan set ethernets.eth0.gateway4=192.168.0.1
      sudo netplan set ethernets.eth0.nameservers.addresses=[1.1.1.1]
      sudo netplan try
   }
   $ sudo netplan apply

   # Set static IP of wlan0
   $ {
      sudo netplan set wifis.wlan0.dhcp4=false
      sudo netplan set wifis.wlan0.addresses=[192.168.0.130/24]
      sudo netplan set wifis.wlan0.gateway4=192.168.0.1
      sudo netplan set wifis.wlan0.nameservers.addresses=[1.1.1.1]
      sudo netplan try
   }
   $ sudo netplan apply
   ```