# Power Optimization
Disable unused resources on Raspberry PI in order to reduce power consumption. Right now, ansible playbook is written to provide option to disable below resources([tasks/prepare-pi.yml#L85-L109](https://github.com/veerendra2/raspberrypi-homeserver/blob/main/tasks/prepare-pi.yml#L85-L109)), there are
* HDMI
  ```
  # Disable
  $ sudo /opt/vc/bin/tvservice -o

  # Enable
  $ sudo /opt/vc/bin/tvservice -p
  ```
* Bluetooth
  Add blow config in `/boot/config.txt`
  ```
  [all]
  dtoverlay=disable-bt
  ```
  Disable bluetooth related services
  ```
  sudo systemctl stop {bluetooth,hciuart}
  sudo systemctl disable {bluetooth,hciuart}
  ```
Other option can try which mentioned in [this blog](https://blues.io/blog/tips-tricks-optimizing-raspberry-pi-power/)
* Disable USB Controller
  Disable USB controller
  ```
  echo '1-1' |sudo tee /sys/bus/usb/drivers/usb/unbind
  ```
  Enable USB controller
  ```
  echo '1-1' |sudo tee /sys/bus/usb/drivers/usb/bind
  ```
* Disable on-board LEDs
  Add below config in `/boot/config.txt`
  ```
  [pi4]
  # Disable the PWR LED
  dtparam=pwr_led_trigger=none
  dtparam=pwr_led_activelow=off
  # Disable the Activity LED
  dtparam=act_led_trigger=none
  dtparam=act_led_activelow=off
  # Disable ethernet port LEDs
  dtparam=eth_led0=4
  dtparam=eth_led1=4
  ```
## Reference
* https://github.com/veerendra2/raspberrypi-homeserver/issues/43