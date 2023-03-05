# Bluetooth
List of bluetooth related tools and usages

* Check systemd status
  ```
  $ systemctl status bluetooth
  ```
* [`hcitool`](https://linux.die.net/man/1/hcitool) Related.(hcitool is a deprecated tool)
  ```
  # List bluetooth devices
  $ hcitool dev
  Devices:
        hci0    XX:XX:01:30:XX:XX

  # Scan
  $ hcitool scan
  Scanning ...
  ```
* [bluetoothctl](https://wiki.archlinux.org/title/bluetooth) related.
  ```
  $ bluetoothctl
  Agent registered
  [CHG] Controller E4:5F:01:30:D8:E0 Pairable: yes
  [bluetooth]# power on
  Changing power on succeeded
  [bluetooth]# scan on
  Discovery started
  [CHG] Controller YY:YY:YY:YY:YY:YY Discovering: yes
  [NEW] Device XX:XX:XX:XX:XX:XX Jabra Evolve2 65
  [bluetooth]# trust XX:XX:XX:XX:XX:XX
  [CHG] Device XX:XX:XX:XX:XX:XX Trusted: yes
  Changing XX:XX:XX:XX:XX:XX trust succeeded
  [bluetooth]# connect XX:XX:XX:XX:XX:XX
  Attempting to connect to XX:XX:XX:XX:XX:XX
  ```
* [`btmon` - Bluetooth monitor](https://manpages.ubuntu.com/manpages/xenial/man1/btmon.1.html)
